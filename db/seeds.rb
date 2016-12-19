# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'
#class FormatNeighborhoodInfo

#  def initialize
#  end

#  def parse(val)
#    @parsed_val = JSON.parse(val)
#  end

#end

#open is a synonym for new
raw_neighborhood_data = File.open("lib/neighborhoods_wgs84.shp.json")
#JSON.parse() takes a string/IO obj or one that responds to the read method
#as an argument, not a file
neighborhoods = JSON.parse(raw_neighborhood_data.read)

#neighborhoods['features'].first['geometry']['coordinates'][0][0]
neighborhoods['features'].each do |area|
  @neighborhood = Neighborhood.new
  @neighborhood.name = area['properties']['Description']

  points = []
  area['geometry']['coordinates'][0].each do |point|
    lat = point[1]
    lng = point[0]
    coordinate =Geokit::LatLng.new(lat,lng)

    points << coordinate
  end

  @neighborhood.coordinates = Geokit::Polygon.new(points)
  @neighborhood.save
end


# install and review geokitdata
# create neighborhood model
# set up geocoders
# create neighborhood instances via parsing
