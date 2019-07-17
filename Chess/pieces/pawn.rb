
class Pawn < Piece

  def symbol
    :p
  end

  def forward_dir
    color == "black" ? 1 : -1
  end

  def at_start_row?
    (color == "black" && pos[0] == 1 )|| (color == "white" && pos[0] == 6)
  end

  def move_dirs
    [
      [forward_dir, -1],
      [forward_dir, 0],
      [forward_dir, 1]
    ]
  end


end
