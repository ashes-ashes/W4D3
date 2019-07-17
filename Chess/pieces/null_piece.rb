require "singleton"
require_relative "../piece.rb"


class NullPiece
  include Singleton
  
  def initialize; end

  def color; end

  def symbol
    " "
  end

  def inspect
    symbol
  end

  def empty?
    return true
  end

end