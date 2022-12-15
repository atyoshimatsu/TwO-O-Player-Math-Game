class Player
  attr_accessor :life
  def initialize
    @life = 3
  end

  def inccorrect
    @life -= 1
  end
end
