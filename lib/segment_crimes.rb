require 'json'
require 'HTTParty'

raw_neighborhoods = File.open("lib/neighborhoods.shp.json")
parse_file = JSON.parse(raw_neighborhoods.read)
new_file = File.open("lib/neighborhood_crimes.shp.json","w")
new_file << '{ "type": "FeatureCollection", "features": ['

n = 8592

  parse_file['features'].each do |area|
    url = "https://crime-analysis.herokuapp.com/neighborhoods/#{n}"
    response = HTTParty.get(url)
    neighborhood_crimes = response.parsed_response
    type = area['type']
    name = area['properties']['Description']
    crime = neighborhood_crimes.count
    geotype= area['geometry']['type']
    geocoord = area['geometry']['coordinates']

    new_file << "{\"type\":\"#{type}\",\"properties\":{\"name\": \"#{name}\", \"crime\": #{crime}},\"geometry\": {\"type\": \"#{geotype}\", \"coordinates\":#{geocoord}}},"
    n += 1
  end

new_file << "]}"
new_file.close
