class Players
  attr_accessor :lives, :name

  def initialize (name)
    self.lives = 3
    self.name = name
  end

  def lose_life
    self.lives -= 1
  end

end