require 'rubygems'

require 'rails'
require 'active_model'
require 'active_record'
require 'harmonious_dictionary'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

module Rails
  def self.root
    File.join File.dirname(__FILE__),'../'
  end

  def self.env
    'test'
  end
end
