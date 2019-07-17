require "slidable.rb"
require "steppable.rb"

class Piece
  include Steppable, Slidable
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @pos = pos 
    @board = board
  end


end