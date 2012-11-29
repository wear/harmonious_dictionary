# encoding: utf-8
require 'spec_helper'

class Post < ActiveRecord::Base
  extend HarmoniousDictionary::ModelAdditions
  validate_harmonious_of :title
  profanity_filter! :body
  profanity_filter  :note
end

describe HarmoniousDictionary::ModelAdditions do
  let(:post) { @post = Post.create title:'戴秉国在中国',body:'戴秉国在中国',note:'戴秉国在中国' }

  it 'should validate for harmonious' do
    post.errors[:title].should == ['不能含有敏感词']
  end

  it 'should filter! any harmonious words' do
    post.body.should == '***在中国'
  end

  it 'should filter harmonious words but not change original content' do
    post.note_clean.should  == '***在中国'
    post.note.should == '***在中国'
  end
end

