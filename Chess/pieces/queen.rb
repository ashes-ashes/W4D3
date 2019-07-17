require_relative "../piece_types/slidable.rb"

class Queen < Piece

  include Slidable

  def move_dirs
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