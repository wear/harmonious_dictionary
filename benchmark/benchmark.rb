require 'rubygems'
require 'benchmark'

# 测试前现在本地建立词库索引
# 如需独立服务，测试前请先把切词服务起起来 bin/rseg_server

require_relative "../lib/harmonious_dictionary"

module Rails
  def self.root
    File.join File.dirname(__FILE__),'../'
  end

  def self.env
    'test'
  end
end

%w(100 1000 10000).each do |word_count|
  puts "\n  --#{word_count} words string-----"
  text = ''
  File.open(File.join(File.dirname(__FILE__),"text_test_#{word_count}.txt"), "r") { |f| text = f.read }
     
  puts '  Run a single time using local'
  puts Benchmark.measure { HarmoniousDictionary.clean(text) }

  puts '  Run a single time using remote'
  puts Benchmark.measure { HarmoniousDictionary.clean_by_remote(text) }

  # n = 50
  # puts "  Run #{n} times by local"
  # Benchmark.bm do |x|
  #   x.report { 1.upto(n) do ; HarmoniousDictionary.clean(text); end }
  # end

  # puts "  Run #{n} times by remote"
  # Benchmark.bm do |x|
  #   x.report { 1.upto(n) do ; HarmoniousDictionary.clean_by_remote(text); end }
  # end
end



