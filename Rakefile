require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'echoe'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

Echoe.new('harmonious_dictionary', '0.1.0') do |p|
  p.description     = "filter any words that need to be harmonized"
  p.url             = ""
  p.author          = "Stephen Kong"
  p.email           = "wear63659220@gmai.com"
  p.ignore_pattern  = ["tmp/*", "script/*","dictionary/*"]
  # p.development_dependencies = ['echoe','rspec','sinatra',]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }