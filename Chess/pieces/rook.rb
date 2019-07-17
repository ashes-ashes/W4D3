require_relative "../piece_types/slidable.rb"

class Rook < Piece

  include Slidable

  def move_dirs
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
    ]
  end

end