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
  @side_a = params.fetch("length").to_f
  @side_b = params.fetch("width").to_f
  @side_c = params.fetch("height").to_f
  @lbs = params.fetch("weight").to_f
  # binding.pry
  package_cost = Parcel.new(@side_a, @side_b, @side_c, @lbs)
  @cost_response = package_cost.cost_to_ship
  erb(:output)
end
