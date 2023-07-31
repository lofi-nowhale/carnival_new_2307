require 'rspec'
require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do 
  it 'exists' do 
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1).to be_a(Ride)
  end

  it 'has readable attributes' do 
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1.name).to eq("Carousel")
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.total_revenue).to eq(0)
    expect(ride1.rider_log).to eq({})
  end

  it 'can tell if the visitor preference matches the ride exitement tags > pref_match?' do 
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor1.add_preference(:gentle)
    visitor3 = Visitor.new('Penny', 64, '$15')

    expect(ride1.pref_match?(visitor1)).to eq(true)
    expect(ride3.pref_match?(visitor3)).to eq(false)

    visitor3.add_preference(:thrilling)

    expect(ride3.pref_match?(visitor3)).to eq(true)
  end

  it 'can tell if a visitor has enough money to pay the rides admission fee' do 
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Sam', 36, '$1')

    expect(ride1.afford?(visitor1)).to eq(true)
    expect(ride1.afford?(visitor2)).to eq(true)
    expect(ride3.afford?(visitor1)).to eq(true)
    expect(ride3.afford?(visitor2)).to eq(false)

  end

  it 'can board riders, this action will subtract from a riders spending money, add to the rides total_revenue and will add the rider to the rider log' do 
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
  end
end