require_relative "../piece_types/slidable.rb"
require_relative "../piece.rb"


class Bishop < Piece

  include Slidable

  def symbol
    :B
  end

  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end

end