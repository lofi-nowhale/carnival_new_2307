class Ride 
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log
  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @rider_log = Hash.new{0}
  end

  def total_revenue
    rider_log.values.sum * @admission_fee
  end

  def pref_match?(visitor)
    visitor.preferences.include?(@excitement)
  end

  def can_afford?(visitor)
    visitor.spending_money >= @admission_fee
  end

  def charge(visitor)
    visitor.spending_money -= @admission_fee
  end

  def board_rider(visitor)
    if pref_match?(visitor) && can_afford?(visitor) && visitor.tall_enough?(min_height)
      @rider_log[visitor] += 1
      charge(visitor)
    end
  end
end