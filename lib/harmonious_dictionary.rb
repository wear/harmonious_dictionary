# encoding: utf-8

require "harmonious_dictionary/rseg"
require "harmonious_dictionary/version"
require "harmonious_dictionary/model_additions"
require "harmonious_dictionary/railtie" if defined? Rails

module HarmoniousDictionary
  def self.clean?(input)
    results = Rseg.segment(input)
    results.size > 0 ? false : true
  end

  def self.clean_by_remote?(input)
    results = Rseg.remote_segment(input)
    results.size > 0 ? false : true
  end

  def self.clean_by_remote(input)
    results = Rseg.remote_segment(input)
    results.each do |result|
      encode_result = result.force_encoding('utf-8')
      input.gsub! /#{encode_result}/,self.clean_word_basic(encode_result)
    end
    input
  end

  def self.clean(input)
    results = Rseg.segment(input)
    results.each{|result| input.gsub! /#{result}/,self.clean_word_basic(result) }
    input
  end

  def self.harmonious_words(input)
    return Rseg.segment(input)
  end

  def self.clean_word_basic(word)
    clearn_words = ""
    word.size.times{  clearn_words << "*" }
    clearn_words
  end

  def self.chinese_harmonious
    Rseg.instance.send(:engines).first.dictionary
  end
end