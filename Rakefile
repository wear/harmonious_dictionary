require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }