$KCODE = 'UTF8' 
require 'yaml'

namespace :harmonious_dictionary do
  desc "generate harmonious dictionary for use"
  task 'generate' do
    puts "Processing chinese words..."
    tree = {}
    path = File.join(File.dirname(__FILE__), '../dictionary', 'chinese_dictionary.txt')
    process(path, tree)
    
    File.open(hash_path, "wb") {|io| Marshal.dump(tree, io)}  
    puts 'Done'

    puts 'Processing english words...'
    english_dictionary = []
    path = File.join(File.dirname(__FILE__), '../dictionary', 'english_dictionary.txt')
    process_english_words(path,english_dictionary)
    puts english_dictionary.inspect
    File.open(yaml_path, "wb") {|io| YAML::dump(english_dictionary, io)} 
    puts 'Done'
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
    File.join(File.dirname(__FILE__), '../dictionary/harmonious.hash')
  end

  def yaml_path
    File.join(File.dirname(__FILE__), '../dictionary/english.yml')
  end

end