class Ride
  attr_reader :admission_fee, :excitement, :min_height, :name, :rider_log, :total_revenue
  def initialize(ride_details)
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @min_height = ride_details[:min_height]
    @name = ride_details[:name]
    @rider_log = {}
    @total_revenue = 0
  end

  def board_rider(visitor)
    if pref_match?(visitor) && afford?(visitor) && visitor.tall_enough?(min_height)
      charge(visitor)
      
      rider_log[visitor] = visitor
    end
  end

  def pref_match?(visitor)
    visitor.preferences.include?(@excitement)
  end

  def afford?(visitor)
    visitor.spending_money >= @admission_fee
  end

  def charge(visitor)
    @spending_money = visitor.spending_money - admission_fee
  end
end