require_relative "meaning/version"
Dependencies =  ['open-uri','nokogiri']
Dependencies.each {|dependency| require dependency}
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
				fetch_for("definitions",".def")
				fetch_for("examples",".eg")
			end 
		end

		def sound
			@dictionary[:sound] = sanatize(@doc.css(".pos-header").first.text)
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
				true
			rescue
				@dictionary[:error] =  "Not even a word"
				false
			end
		end

		def load_page
			@doc ||= Nokogiri::HTML(file)
		end

		def file
			open(api)
		end
		def api
			"http://dictionary.cambridge.org/dictionary/english/#{dictionary[:word].downcase}"
		end
	end
end
