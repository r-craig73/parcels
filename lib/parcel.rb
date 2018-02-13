require('pry')

class Parcel

  def initialize(length, width, height, weight)
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  def volume
    @length * @width * @height
  end

  def cost_to_ship
    @cost = volume * @weight / 500
  end

  def cost_to_wrap
    surface_area = @length*@width*2 + @width*@height*2 + @height*@length*2
    if (surface_area <= 600)
      3
    end
    5
  end
end
