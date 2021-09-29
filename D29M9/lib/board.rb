class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){[]}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |i|
      4.times{@cups[i] << :stone}
    end
    (7..12).each do |i|
      4.times{@cups[i] << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 0

    raise "Starting cup is empty" if @cups[start_pos].count == 0
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    current_pos = start_pos
    until stones.empty?
      current_pos += 1
      current_pos = 0 if current_pos > 13
      if current_pos == 6
        @cups[6] << stones.pop if current_player_name == @player1
      elsif current_pos == 13
        @cups[13] << stones.pop if current_player_name == @player2
      else
        @cups[current_pos] << stones.pop
      end
    end
    self.render
    return self.next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].count == 1 
      return :switch 
    else
      ending_cup_idx
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
    (0...6).all?{|i| @cups[i].empty?} || (7...13).all?{|i| @cups[i].empty?}
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      return @player1 if player1_count > player2_count
      @player2
    end
  end
end
