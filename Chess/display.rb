require "colorize"
require_relative "cursor"
require_relative "board"

class Display 
  
  attr_reader :cursor, :dev_mode

  def initialize(board, dev_mode = false)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @dev_mode = dev_mode
  end

  def render
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        (i + j).odd? ? background = :light_black : background = :light_blue
        if @cursor.cursor_pos == [i, j]
          @cursor.selected ? background = :green : background = :red
        end
        print " #{piece.symbol} ".colorize(:color => piece.color, :background => background)
      end
      puts ""
    end
    if dev_mode == true
      puts <<-Debug
  Debug Info:
    Cursor Position: #{@cursor.cursor_pos}
    In Check (black) : #{@board.in_check?(:black)}
    In Check (white) : #{@board.in_check?(:white)}
    Piece at cursor: #{@board[cursor.cursor_pos]}
      Position:
        #{@board[cursor.cursor_pos].pos}
      Moves:
        #{@board[cursor.cursor_pos].moves}
      Valid Moves:
        #{@board[cursor.cursor_pos].valid_moves}
      
  Debug
    end
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  display = Display.new(board, true)
  # board.move_piece([1,1], [2,1])
  # board.move_piece([0,1], [2,0])
  # board.move_piece([0,2], [1,1])
  # board.move_piece([1,1], [6, 6])
  # board.move_piece([0, 3], [0, 2])
  # board.move_piece([0, 4], [0, 3])
  # board.move_piece([0,0], [0,1])


  board.move_piece([1, 4], [2, 4])
  board.move_piece([6, 3], [4, 3])
  board.move_piece([1, 5], [3, 5])
  board.move_piece([7, 3], [3, 6])
  begin
  while true
    display.render
    display.cursor.get_input
    system("clear")
  end
  rescue StandardError => e
    puts e.backtrace.join("\n")
    puts e
    Process.exit(1)
  end
end