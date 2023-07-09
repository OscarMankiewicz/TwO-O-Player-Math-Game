class Player
    attr_reader :name
  
    def initialize(name)
      @name = name
      @lives = 3
    end
    
    def to_s
        @name
    end
  
    def get_lives
      @lives
    end
  
    def reduce_life
      @lives -= 1
    end
end
  