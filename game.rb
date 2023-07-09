class Game
    attr_reader :players
  
    def initialize(num_players)
      @players = []
      num_players.times do |i|
        @players << Player.new("Player #{i + 1}")
      end
      @current_player = @players.first
    end
  
    def start_game
      puts "=== Let's start the math game ==="
      loop do
        puts "\n=== Turn: #{@current_player} ==="
        question = MathQuestion.new
        question.generate_question
        puts "Question: #{question}"
        answer = gets.chomp.to_i
        check_answer(question, answer)
        display_lives
        break if game_over?
        switch_player
      end
      announce_winner
    end
  
    def check_answer(question, answer)
      if question.check_answer(answer)
        puts "Correct answer!"
      else
        @current_player.reduce_life
        puts "Wrong answer! #{@current_player} loses a life."
      end
    end
  
    def display_lives
        puts "Current Lives:"
        lives_info = @players.map { |player| "#{player}: #{player.get_lives}/3" }
        puts lives_info.join(' vs ')
    end
      
  
    def game_over?
      @players.any? { |player| player.get_lives <= 0 }
    end
  
    def announce_winner
      winner = @players.reject { |player| player.get_lives <= 0 }.first
      puts "\n=== Game Over ==="
      puts "#{winner} wins the game!"
    end
  
    private
  
    def switch_player
      index = @players.index(@current_player)
      @current_player = @players[(index + 1) % @players.length]
    end
end