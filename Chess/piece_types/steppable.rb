module Steppable

  def moves
    new_moves = move_diffs.map do |move|
      [move[0] + pos[0], move[1] + pos[1]]
    end
    new_moves.select { |step| board.valid_pos?(step) && board[step].color != color }
  end

  private
  
  def move_diffs; end

end