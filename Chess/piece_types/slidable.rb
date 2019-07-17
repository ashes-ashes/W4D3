module Slidable

  def stepper(start, dir)
    [start[0] + dir[0], start[1] + dir[1]]
  end
    
  def moves
    possible_moves = []
    moves_dirs.each do |dir|
      step = stepper(pos, dir)
      while board[step].valid_pos? && board[step] == nil
        possible_moves << step
        step = stepper(step, dir)
      end
      if board[step].color != color
        possible_moves << step
      end
    end
    possible_moves
  end

end