#!/home/linuxbrew/.linuxbrew/bin/env ruby
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcel')
require('pry')


get('/') do
  @description = "Please enter the package dimensions & weight"
  erb(:input)
end



get('/output') do
  @length = params.fetch("length").to_f.round(2)
  @width = params.fetch("width").to_f.round(2)
  @height = params.fetch("height").to_f.round(2)
  @lbs = params.fetch("weight").to_f.round(2)
  binding.pry
  parcel = Parcel.new(@length, @width, @height, @lbs)
  @cost_response = parcel.cost_to_ship.round(2)
  if (params.fetch("wrap") == "do")
    @cost_response += parcel.cost_to_wrap
  end
  erb(:output)
end
