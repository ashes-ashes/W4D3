class Piece
  attr_accessor :pos, :board
  attr_reader :color

  def initialize(color, board, pos)
    @color = color
    @pos = pos 
    @board = board
  end

  def dup(new_board)
    #passing in board on which to place duplicated piece,
    #to reference new board in new piece instance
    self.class.new(@color, new_board, @pos.dup)
  end

  def empty?
    return false
  end

  def inspect
    symbol
  end

  def valid_moves
    self.moves.reject do |move|
      newboard = board.dup
      newboard.move_piece(self.pos.dup, move)
      newboard.in_check?(color)
    end
  end


end