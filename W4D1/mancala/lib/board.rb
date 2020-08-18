class Board
  attr_accessor :cups

  # Player sees the following board:
#     12  11  10  9  8  7
# [store2]            [store1]
#     1   2   3  4  5  6

  # Actual board layout
#     12  11  10  9  8  7
# [13]                   [6]
#     0   1   2  3  4  5


  def initialize(name1, name2)
    @player_1_name = name1
    @player_2_name = name2

    # there are 14 cups in the Mancala board.
    # each cup can store a number of stones
    @cups = Array.new(14){Array.new}

    # fills the non-store cups with four stones
    @cups.each_with_index do |cup, idx|
      # we do not add 4 stones to index 6 and 13
      unless idx == 6 || idx == 13
        4.times{cup << :stone}
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    # Greater than 12 because 13 is a player's store
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # Store the stones of the cup we are about to empty into a new array.
    # Think of stone_arr as a player's hand.
    # The current player's hand is holding the stones
    # and redistributing the stones across the Mancala board
    stone_arr = self.cups[start_pos]

    # set the cup at start_pos to an empty array
    self.cups[start_pos] = []

    # while there is still a stone remaining in stone_arr,
    # add the stone to the other cups
    while stone_arr.length != 0
      # starting from the cup after cups[start_pos]
      start_pos += 1

      # if the index is out of the bonds of the board, reset index to start at 0
      if start_pos > 13
        start_pos = 0
      end

      # then depending on what the index is, shovel in a stone
      if start_pos == 6
        # if the index is 6, check if it is player 1's turn.
        # because we only add to player 1's store, if it is their turn
        if current_player_name == @player_1_name
          self.cups[start_pos] << stone_arr.pop
        end
      elsif start_pos == 13
        # if the index is 13, check if it is player 2's turn.
        # because we only add to player 2's store, if it is their turn
        if current_player_name == @player_2_name
          self.cups[start_pos] << stone_arr.pop
        end
      else
        # otherwise, if the cup is not a player's store,
        # just add a stone into it
        self.cups[start_pos] << stone_arr.pop
      end

      # places stones in the current player's cup
      # doesn't place stones in the opponent's cup
    end

    # Call Board#render to the board at the end of each move.
    self.render

    # Call Board#next_turn to the board at the end of each move.
    self.next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      # if the ending cup is either player's store, then return prompt
      return :prompt
    elsif self.cups[ending_cup_idx].length == 1
      # if the ending cup was not either player's store and
      # if the ending cup was originally empty
      # right before stopping in it at the end of the turn
      # then, return switch.
      # The ending cup should have ONLY 1 stone.
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
    if self.cups[0..5].all?{|cup| cup.length == 0} ||
        self.cups[7..12].all?{|cup| cup.length == 0}
      return true
    end
    false
  end

  def winner
    case self.cups[6].length <=> self.cups[13].length
    when 1
      return @player_1_name
    when -1
      return @player_2_name
    when 0
      return :draw
    end
  end
end
