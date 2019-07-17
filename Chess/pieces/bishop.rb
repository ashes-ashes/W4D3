require_relative "../piece_types/slidable.rb"

class Bishop < Piece

  include Slidable

  def move_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end

end