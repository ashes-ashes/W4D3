require_relative "../piece.rb"

class Pawn < Piece

  def symbol
    :p
  end

  # def move_dirs
  #   [
  #     [forward_dir, 0]
  #   ]
  # end

  def moves
    forward_steps + side_attacks
  end

  private

  def forward_dir
    color == :black ? 1 : -1
  end

  def at_start_row?
    (color == :black && pos[0] == 1 )|| (color == :white && pos[0] == 6)
  end

  def forward_steps
    steps = []
    if @board[[pos[0]+forward_dir, pos[1]]].empty?
      steps << [pos[0]+forward_dir, pos[1]]
      if at_start_row? && @board[[pos[0]+(forward_dir*2), pos[1]]].empty?
        steps << [pos[0]+(forward_dir*2), pos[1]]
      end
    end
    steps
  end

  def side_attacks
    attacks = []

    side_attack_1 = @board[[pos[0]+forward_dir, pos[1] + 1]]
    side_attack_2 = @board[[pos[0]+forward_dir, pos[1] - 1]]

    if !side_attack_1.empty? && side_attack_1.color != self.color
      attacks << side_attack_1.pos
    end
    
    if !side_attack_2.empty? && side_attack_2.color != self.color
      attacks << side_attack_2.pos
    end

    attacks
  end

end
