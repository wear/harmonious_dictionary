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
end

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :posts do |t|
    t.string :title
    t.text   :body
    t.text   :note
  end
end