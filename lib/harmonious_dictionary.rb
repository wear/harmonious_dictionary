# encoding: utf-8

require File.join(File.dirname(__FILE__), 'rseg')

class HarmoniousDictionary
  # include Rseg

  class << self

    def clean?(input)
      results = Rseg.segment(input)
      results.size > 0 ? false : true
    end

    def clean_by_remote?(input)
      results = Rseg.remote_segment(input)
      results.size > 0 ? false : true
    end

    def clean_by_remote(input)
      results = Rseg.remote_segment(input)
      results.each do |result|
        input.gsub! /#{result}/,self.clean_word_basic(result)
      end
      input
    end

    def clean(input)
      results = Rseg.segment(input)
      results.each{|result| input.gsub! /#{result}/,self.clean_word_basic(result) }
      input
    end

    def harmonious_words(input)
      return Rseg.segment(input)
    end

    def clean_word_basic(word)
      clearn_words = ""
      word.size.times{  clearn_words << "*" }
      clearn_words
    end

    def chinese_harmonious
      Rseg.instance.send(:engines).first.dictionary
    end
  end

end