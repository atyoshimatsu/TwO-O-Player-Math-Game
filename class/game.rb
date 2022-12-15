class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
  end

  def question()
    num1 = rand(1..20)
    num2 = rand(1..20)

    puts "----- NEW TURN -----"
    print "Player #{@turn}: What does #{num1} plus #{num2} equal?\nPlayer #{@turn == 1 ? 2 : 1} > "
    ans = gets.chomp.to_i
    if ans != num1 + num2
      @player2.inccorrect if @turn == 1
      @player1.inccorrect if @turn == 2
      puts "Player #{@turn}: Seriously? No!"
      puts "P1: #{@player1.life}/3 P2: #{@player2.life}/3"
    end

    if ans == num1 + num2
      puts "Player #{@turn}: Yes! You are correct."
      puts "P1: #{@player1.life}/3 P2: #{@player2.life}/3"
    end

    @turn = @turn == 1 ? 2 : 1
  end

  def start
    while @player1.life > 0 && @player2.life > 0 do
      question()
    end
    puts "Player 1 wins with a score of #{@player1.life}/3" if @player2.life == 0
    puts "Player 2 wins with a score of #{@player2.life}/3" if @player1.life == 0
    puts "----- GAME OVER-----"
    puts "Good bye!"
  end

end
