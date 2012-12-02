require 'yaml'

namespace :harmonious_dictionary do
  desc "generate harmonious dictionary for use"
  task :generate => :environment do
    chinese_dictionary_path = File.join(Rails.root, 'config','harmonious_dictionary','chinese_dictionary.txt')
    english_dictionary_path = File.join(Rails.root, 'config','harmonious_dictionary','english_dictionary.txt')

    puts "Processing chinese words..."
    tree = {}
    process(chinese_dictionary_path, tree)
    File.open(hash_path, "wb") {|io| Marshal.dump(tree, io)}  
    puts 'Done'

    puts 'Processing english words...'
    english_dictionary = []
    process_english_words(english_dictionary_path,english_dictionary)
    File.open(yaml_path, "wb") {|io| YAML::dump(english_dictionary, io)} 
    puts 'Done'
  end
end

def process_english_words(path,list)
  File.open(path, 'r') do |file|
    file.each_line{|line| list << line.gsub!("\n",'') }
  end
end

def process(path, tree)
  File.open(path, 'r') do |file|
    file.each_line do |line|
      node = nil
      line.chars.each do |c|
        next if c == "\n" || c == "\r"
        if node
          node[c] ||= {}
          node = node[c]
        else
          tree[c] ||= Hash.new
          node = tree[c]
        end
      end
      node[:end] = true
    end
  end
end

def hash_path
  File.join(Rails.root, 'config','harmonious_dictionary','harmonious.hash')
end

def yaml_path
  File.join(Rails.root, 'config','harmonious_dictionary','harmonious_english.yml')
end

