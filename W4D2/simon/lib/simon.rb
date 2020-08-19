class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    unless game_over
      show_sequence
      require_sequence
      round_success_message
      self.sequence_length += 1
    end
    # Kevin Lai
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    #it is generally impractical to test console user input,
    #so the specs don't test require_sequence.
    #The goal of require_sequence is to prompt the user to
    #repeat back the new sequence that was just shown to them,
    #one color at a time.
    #If they give an incorrect color,
    #it should immediately set @game_over to be true.
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
