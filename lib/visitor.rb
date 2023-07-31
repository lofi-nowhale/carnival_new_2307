class Visitor
  attr_reader :name, :height, :cash, :preferences
  def initialize(name, height, cash)
    @name = name
    @height = height
    @cash = cash
    @preferences = []
  end

  def spending_money
    @cash.delete('$').to_i
  end

  def add_preference(preference)
    @preferences << preference
  end
end