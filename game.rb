class Game
  # intialize players and set player1 as first player
  def initialize
    @player1 = Players.new("Player1")
    @player2 = Players.new("Player2")
    @current_player = @player1
  end

  def ready
    # ends game when either player hits 0 lives
    while @player1.lives > 0 && @player2.lives > 0 do
      
      # initializes and prints math questions
      @question = Questions.new 
      puts @question.ask_question(@current_player.name)

      # compares input with correct answer
      # gets will return input as string, need to convert input to Integer
      if @question.correct_answer?(gets.chomp.to_i)
        puts "#{@current_player.name}: YES! you are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      # alternates players between each question
      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end

      # prints a message at the end of each turn or when a player wins
      if @player1.lives < 1
        puts "----- GAME OVER -----"
        puts "Player 2 wins with a score of #{@player2.lives}/3"
      elsif @player2.lives < 1
        puts "----- GAME OVER -----"
        puts "Player 1 wins with a score of #{@player1.lives}/3"
      else
        puts "----- NEW TURN -----"
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      end
    end
  end
end