require 'set'

module HarmoniousDictionary
  module RsegEngine
    LETTER_SYMBOLS = Set.new ('a'..'z').to_a + ('A'..'Z').to_a

    class English < Engine
      def initialize
        @word = ''
        super
      end
    
      def process(char)
        match = false
        word = nil
      
        if LETTER_SYMBOLS.include?(char)
          @word << char
          match = true
        else
          word = @word
          @word = ''
          match = false
        end
        [match, word]
      end  
    end
  end
end
