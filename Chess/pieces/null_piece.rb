require "singleton"
require_relative "../piece.rb"


class NullPiece < Piece
  include Singleton
  
  def initialize; end

  def color; end

  def symbol
    " "
  end

  def moves
    []
  end

  def inspect
    symbol
  end

  def empty?
    return true
  end

end