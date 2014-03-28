#!/usr/bin/env ruby
# encoding: utf-8
require 'cgi'
require 'open-uri'
require 'json'
require 'colorize'

TRANSLATE_URL = "http://translate.google.com/translate_a"

class Translation

  def initialize(url=TRANSLATE_URL, langfrom, langto, text)
    @url      = url
    @langfrom = langfrom
    @langto   = langto
    @text     = text
  end

  def get_translation_url
    "#@url/t?client=x&text=#{CGI.escape @text}&sl=#@langfrom&tl=#@langto"
  end

  def get_response
    open(get_translation_url).read
  end

  def parse_response
    JSON.parse(get_response)
  end

  def get_main_translation(data)
    data["sentences"][0]["trans"]
  end

  def get_other_translations(data)
    return nil if data['dict'] == nil
    result = {}
    data['dict'].each do |part_of_speech|
      part_name = part_of_speech["pos"]
      terms = part_of_speech["terms"]
      result[part_name] = terms
    end
    result
  end
  
  def print_translations
    data = parse_response
    main_translation = get_main_translation(data)
    other_translations = get_other_translations(data)
    puts main_translation.blue
    unless other_translations == nil
      puts "#{'-'*10}"
      other_translations.sort.each do |part_of_speech, words|
        puts "#{part_of_speech}:".yellow
        words.each {|word| puts "#{word}".magenta}
        puts "#{'-'*10}"
      end
    end
  end
end
