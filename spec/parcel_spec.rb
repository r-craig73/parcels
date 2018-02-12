require('rspec')
require('pry')
require('parcel')

describe('Parcel') do
  describe('#volume') do
    it('evaluate parcel volume') do
      parcel = Parcel.new(5, 10, 10, 6)
      expect(parcel.volume).to(eq(500))
    end
  end

  describe('#cost_to_ship') do
    it('evaluate parcel cost') do
      parcel = Parcel.new(5, 10, 10, 6)
      expect(parcel.cost_to_ship).to(eq(6))
    end
  end
end
