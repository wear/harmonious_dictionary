module HarmoniousDictionary
  module RsegEngine
    class Dict < Engine    
      def initialize(&block)
        @dict_path = block.call
        @word = ''
        super
      end

      def dictionary
        @@root
      end
    
      def process(char)
        @root ||= load_dict(@dict_path)
        @node ||= @root

        match = false
        word = nil
        
        if @node[char]
          @word << char
          @node = @node[char]
          match = true
        else
          if @node[:end] || @word.chars.to_a.length == 1
            word = @word
          else
            word = @word.chars.to_a
          end
        
          @node = @root
          @word = ''
          match = false
        end
        [match, word]
      end
    
      private

      def load_dict(path)
        begin
          File.open(path, "rb") {|io| Marshal.load(io) }
        rescue => e
          puts e
          exit
        end
      end
    end
  end
end