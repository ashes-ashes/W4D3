require_relative "piece"

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @rows.each_with_index do |row, i|
      if i < 2 || i > 5
        rows[i].map! { |el| el = Piece.new }
      end
    end

  end

  def [](pos)
    rows[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @rows[pos[0]][pos[1]] = val
  end

  def move_piece(start_pos, end_pos)
    if !valid_pos?(start_pos) || !valid_pos?(end_pos)
      raise ArgumentError, "There's nothing there to move."
    elsif !self[start_pos].moves.include?(end_pos) || self[end_pos] == nil 
      raise ArgumentError, "You can't move that there."
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil #NullPiece
      
      self[end_pos].pos = end_pos
    end

  end

  def valid_pos?(pos)
    return false if !pos

    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  # p b.rows

end

