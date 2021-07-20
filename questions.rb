class Questions
  
  attr_accessor :num1, :num2, :answer

  def initialize
    self.num1 = rand(1 .. 20)
    self.num2 = rand(1 .. 20)
    self.answer = self.num1 + self.num2
  end

  def ask_question(name)
    "#{name}: What does #{@num1} plus #{@num2} equal?"
  end

  def correct_answer?(input)
    self.answer == input
  end
end
