class MathQuestion
    def initialize
      @number1 = nil
      @number2 = nil
    end
  
    def generate_question
      @number1 = rand(1..20)
      @number2 = rand(1..20)
    end
  
    def to_s
      "What is #{@number1} + #{@number2}?"
    end
  
    def check_answer(answer)
      answer == (@number1 + @number2)
    end
end
  