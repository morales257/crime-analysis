require 'json'

class FormatNeighborhoodInfo

  def initialize
  end

  def parse(val)
    @parsed_val = JSON.parse(val)
  end

end

#open is a synonym for new
raw_neighborhood_data = File.open("lib/neighborhoods_wgs84.shp.json")
#JSON.parse() takes a string/IO obj or one that responds to the read method
#as an argument, not a file
neighborhoods = FormatNeighborhoodInfo.new.parse(raw_neighborhood_data.read)
puts neighborhoods['features'].first['geometry']['coordinates'][0][0]


# install and review geokitdata
# create neighborhood model
# set up geocoders
# create neighborhood instances via parsing
