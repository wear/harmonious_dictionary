# encoding: utf-8

require 'spec_helper'

describe HarmoniousDictionary do

  describe 'segment' do
    it 'should return harmonious word for sentence' do
      HarmoniousDictionary.harmonious_words('戴秉国在中国').should == ['戴秉国']
    end

    it 'should return english,url and chiese words' do
      HarmoniousDictionary.harmonious_words('戴秉国 in china,watch cctv.com.let fuck it').should == ['戴秉国','fuck']
    end
  end

  it 'should find harmonious chinese  words' do
    HarmoniousDictionary.clean?('李源潮在中国').should == false
  end

  it 'should pass good words' do
    HarmoniousDictionary.clean?('过去').should == true
  end

  it 'should clean sentence by replace harmonious words by *' do
    HarmoniousDictionary.clean('戴秉国在中国').should == '***在中国'
  end

  it 'should replace harmonious with *' do
    HarmoniousDictionary.clean_word_basic('大米').should == '**'
  end

  it 'should use remote server for segment' do
    HarmoniousDictionary.clean_by_remote('戴秉国在中国').should == '***在中国'
  end

end