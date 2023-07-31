class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, spending_money)
    @height = height
    @name = name
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(min_height)
    @height >= min_height
  end
end