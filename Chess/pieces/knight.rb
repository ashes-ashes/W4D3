require_relative '../piece_types/steppable.rb'

class Knight < Piece

  include Steppable

  def symbol
    :N
  end

  def move_diffs
    [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end

end