

class Piece
  attr_accessor :pos, :board
  attr_reader :color

  def initialize(color, board, pos)
    @color = color
    @pos = pos 
    @board = board
  end

  def empty?
    return false
  end

  def inspect
    symbol
  end

end