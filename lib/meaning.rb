require_relative "meaning/version"
require 'net/http'
require 'uri'
require 'nokogiri'

module Meaning
	class MeaningLab
		attr_reader :dictionary
		def initialize word
			word =  word.dup.capitalize
			@dictionary = {word: word}
			define
		end

		private
		def define
			if get_the_content
				sound
				fetch_for("definitions", ".def.ddef_d")
				fetch_for("examples", ".examp.dexamp .eg")
			end 
		end

		def sound
			# This will get both UK and US pronunciations, you can refine as needed
			@dictionary[:sound] = @doc.css(".pron.dpron").map { |el| el.text.strip }.uniq.join(" | ")
		end

		def sanatize text
			text.gsub!(/(\t)+|(\n)+|\s{2,}|\/+|#{word.capitalize}|#{word.downcase}/,"")
		end

		def word
			dictionary[:word]
		end

		def fetch_for name,css_class
			elements = []
			@doc.css(css_class).each do |element|
				elements  << sanatize_from_colon(element.text)
			end
			@dictionary[name.to_sym]  = elements unless elements.empty?
		end
		
		def sanatize_from_colon text
			text.gsub!(":",".")
			text
		end
		
		def get_the_content
			load_page
			begin
				sound
				# Check if we actually got any content
				if @dictionary[:sound].empty? && @doc.css(".def.ddef_d").empty?
					@dictionary[:error] = "Word not found"
					return false
				end
				true
			rescue => e
				@dictionary[:error] = "Not even a word: #{e.message}"
				false
			end
		end

		def load_page
			@doc ||= Nokogiri::HTML(file)
		end

		def file
			uri = URI(api)
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_PEER
			
			request = Net::HTTP::Get.new(uri)
			request['User-Agent'] = 'Mozilla/5.0 (compatible; Meaning Gem)'
			
			response = http.request(request)
			response.body
		rescue => e
			@dictionary[:error] = "Network error: #{e.message}"
			""
		end
		
		def api
			"https://dictionary.cambridge.org/dictionary/english/#{dictionary[:word].downcase}"
		end
	end
end
