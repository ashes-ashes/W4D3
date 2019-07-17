require_relative '../piece_types/steppable.rb'
require_relative "../piece.rb"


class King < Piece
  
  include Steppable

  def symbol
    :K
  end

  def move_diffs
    [
      [1, 0],
      [-1, 0],
      [1, 1],
      [-1, 1],
      [0, 1],
      [0, -1],
      [-1, -1],
      [1, -1]
    ]
  end
  
end