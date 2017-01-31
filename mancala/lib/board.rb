require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, 5) && start_pos.between?(7, 12)
      raise ("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    in_hands = @cups[start_pos]
    @cups[start_pos] = []
    until in_hands.empty?
      if start_pos.between?(0, 12)
        start_pos += 1
      else
        start_pos = 0
      end

      unless (current_player_name == @player1 && start_pos == 13) ||
             (current_player_name == @player2 && start_pos == 6)
        @cups[start_pos] << in_hands.pop
      end
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if (ending_cup_idx == 6) ||
          (ending_cup_idx == 13)
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].flatten.empty? || @cups[7..12].flatten.empty?
      return true
    end
    false
  end

  def winner
    p1_length = @cups[6].length
    p2_length = @cups[13].length
    if p1_length == p2_length
      return :draw
    elsif p1_length > p2_length
      return @player1
    else
      return @player2
    end
  end
end
