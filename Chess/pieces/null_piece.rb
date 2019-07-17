require "singleton"

class NullPiece
  include Singleton
  
  def initialize; end

  def color; end
  def symbol; end

end