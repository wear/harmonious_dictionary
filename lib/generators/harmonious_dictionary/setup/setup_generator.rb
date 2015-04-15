require "rails/generators"

module HarmoniousDictionary
  module Generators
    class SetupGenerator < ::Rails::Generators::Base
      desc "This generator creates necessary at config/harmonious_dictionary"
      source_root File.expand_path("../templates", __FILE__)

      def generate_setup  
        #copy_file "remote_server.yml", "config/harmonious_dictionary/remote_server.yml"  
        copy_file "chinese_dictionary.txt", "config/harmonious_dictionary/chinese_dictionary.txt"  
        copy_file "english_dictionary.txt", "config/harmonious_dictionary/english_dictionary.txt"  
      end
    end
  end
end
