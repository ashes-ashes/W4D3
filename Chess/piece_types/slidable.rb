module Slidable

  def stepper(start, dir)
    [start[0] + dir[0], start[1] + dir[1]]
  end
    
  def moves
    possible_moves = []
    move_dirs.each do |dir|
      step = stepper(pos, dir)
      while board.valid_pos?(step) && board[step].empty?
        possible_moves << step
        step = stepper(step, dir)
      end
      if board.valid_pos?(step) && board[step].color != color
        possible_moves << step
      end
    end
    possible_moves
  end

end