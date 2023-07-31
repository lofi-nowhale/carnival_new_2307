require 'rspec'
require './lib/visitor'

RSpec.describe Visitor do 
  it 'exists' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1).to be_a(Visitor)
  end

  it 'has readable attributes' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1.name).to eq("Bruce")
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
    expect(visitor1.preferences).to eq([])
  end

  it 'can produce a list of preferences in an array' do 
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1.preferences).to eq([])

    visitor1.add_preference(:gentle)

    expect(visitor1.preferences).to eq([:gentle])

    visitor1.add_preference(:thrilling)

    expect(visitor1.preferences).to eq([:gentle, :thrilling])

  end
end