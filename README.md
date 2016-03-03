# Meaning [![Gem Version](https://badge.fury.io/rb/meaning.svg)](https://badge.fury.io/rb/meaning)

English Dictionary(CLI and API) based on dictionary.cambridge.org 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'meaning'
```
Or install it yourself as:

```bash
$ gem install meaning
```
## Usage
API:
```ruby
word =  Meaning::MeaningLab.new "word"
word.dictionary
```
CLI:
```bash
$ meaning of Disclaimer
```
![CLI](/imgs/factotum.png)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

