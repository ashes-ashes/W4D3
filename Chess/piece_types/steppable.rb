module Steppable

  def moves
    move_diffs.map do |move|
      [move[0] + pos[0], move[1] + pos[1]]
    end
  end

  private
  
  def move_diffs; end

end