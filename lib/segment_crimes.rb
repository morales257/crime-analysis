require 'json'

raw_neighborhoods = File.open("lib/neighborhoods.shp.json")
parse_file = JSON.parse(raw_neighborhoods.read)
neighborhoods = Neighborhood.all
new_file = File.open("lib/neighborhood_crimes.shp.json","w")
new_file << '{ "type": "FeatureCollection", "features": ['

neighborhoods.each do |neighborhood|
  parse_file['features'].each do |area|
    type = area['type']
    name = area['properties']['Description']
    crime = neighborhood.crimes.count
    geotype= area['geometry']['type']
    geocoord = area['geometry']['coordinates']

    new_file << "{\"type\":\"#{type}\",\"properties\":{\"name\": \"#{name}\", \"crime\": #{crime}},\"geometry\": {\"type\": \"#{geotype}\", \"coordinates\":\"#{geocoord}\"}},"
  end
end

new_file << "]}"
new_file.close
