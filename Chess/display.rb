require "colorize"
require_relative "cursor"
require_relative "board"

class Display 
  
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
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
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  display = Display.new(board)

  while true
    display.render
    display.cursor.get_input
    system("clear")
  end
end