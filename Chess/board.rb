require_relative "piece"


require_relative "pieces/pawn.rb"
require_relative "pieces/rook.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/bishop.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/king.rb"
require_relative "pieces/null_piece.rb"

class Board

  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    # NullPiece.new
    rows[1].map!.with_index { |el, i| el = Pawn.new(:black, self, [1, i]) }
    rows[6].map!.with_index { |el, i| el = Pawn.new(:white, self, [6, i]) }

    @rows.each_with_index do |row, i|
      if 6 > i && i > 1
        rows[i].map! {|el| el = NullPiece.instance }
      elsif i == 0 || i == 7
        color = i == 0 ? :black : :white
        rows[i] = [
          Rook.new(color, self, [i, 0]),
          Knight.new(color, self, [i, 1]),
          Bishop.new(color, self, [i, 2]),
          Queen.new(color, self, [i, 3]),
          King.new(color, self, [i, 4]),
          Bishop.new(color, self, [i, 5]),
          Knight.new(color, self, [i, 6]),
          Rook.new(color, self, [i, 7])
        ]
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
    if !valid_pos?(start_pos) || self[start_pos].empty?
      raise ArgumentError, "There's nothing there to move."
    elsif !self[start_pos].moves.include?(end_pos) || !valid_pos?(end_pos)
      raise ArgumentError, "You can't move that there."
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
      
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
  board = Board.new
  # p b.rows
  board.move_piece([1,1], [2,1])
  board.move_piece([0,1], [2,0])
  board.move_piece([0,2], [1,1])
  board.move_piece([1,1], [6, 6])
  board.move_piece([0, 3], [0, 2])
  board.move_piece([0, 4], [0, 3])
  board.move_piece([0,0], [0,1])
  

  #board.move_piece([6, 6], [2, 6])
  #board.move_piece([0, 7], [0, 6])
  #board.move_piece([4, 4], [4, 5])
  #board.move_piece([6, 6], [-3000, -3000])
  #board.move_piece([1, 2], [1, 1])

  p board.rows


  # board.move_piece([1,1], [2,1])

end

