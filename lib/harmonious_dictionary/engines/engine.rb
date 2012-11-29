module RsegEngine
  class Engine
    def initialize
      @running = true
    end
  
    def stop
      @running = false
    end
  
    def run
      @running = true
    end
  
    def running?
      @running
    end
  end
end