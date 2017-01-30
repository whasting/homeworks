class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      system('clear')
      puts "HERE COME THE COLORS:"
      sleep(0.5)
      puts color
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    system('clear')
    puts "Enter the sequence, one element at a time, in order:"
    user_sequence = []
    i = 0
    @seq.each do |color1|
      user_color = gets.chomp
      if user_color != color1
        @game_over = true
        break
      end
      user_sequence << user_color
      i += 1
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nice! Next round..."
  end

  def game_over_message
    puts "Aww, better luck next time!"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

game = Simon.new
game.play
