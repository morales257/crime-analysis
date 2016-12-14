require 'httparty'
require 'json'
require 'pry'
require 'csv'

class PoliceCalls

  def intialize
  end

  def fetch_calls
    sr_id = 4326
    url = "http://c4s.torontopolice.on.ca/arcgis/rest/services/CADPublic/C4S/MapServer/0/query?f=json&returnGeometry=true&spatialRel=esriSpatialRelIntersects&geometry=%7B%22xmin%22%3A-8844681.416948894%2C%22ymin%22%3A5400734.670536583%2C%22xmax%22%3A-8805545.658466935%2C%22ymax%22%3A5439870.42901854%2C%22spatialReference%22%3A%7B%22wkid%22%3A102100%2C%22latestWkid%22%3A3857%7D%7D&geometryType=esriGeometryEnvelope&inSR=102100&outFields=*&outSR=#{sr_id}"
    response = HTTParty.get(url, format: :json)
    calls = response.parsed_response['features']


    calls.each do |i|
      type_eng = i['attributes']['TYP_ENG']

      if type_eng.include?('BREAK & ENTER') || type_eng.include?('ASSAULT') ||
        type_eng.include?('THEFT') || type_eng.include?('ARREST') ||
        type_eng.include?('ROBBERY') || type_eng.include?('SHOOTING') || type_eng.include?('HOMOCIDE')

        @crime = Crime.new
        @crime.objid = i['attributes']['OBJECTID']
        @crime.time = i['attributes']['ATSCENE_TS']
        @crime.district = i['attributes']['DGROUP']
        @crime.call_type = type_eng
        @crime.streets = i['attributes']['XSTREETS']
        @crime.longitude = i['geometry']['x']
        @crime.latitude = i['geometry']['y']

        crime_details = [@crime.call_type, @crime.time, @crime.longitude, @crime.latitude]

        if @crime.save
          puts "Crime #{@crime.objid} added."
          add_data(crime_details)
          true
        else
        puts "Cannot add #{@crime.objid} - #{@crime.errors.full_messages}"
          false
        end
      end

    end
  end

  def add_data(data)
    puts "adding data to csv.."
    CSV.open("police_calls.csv", "a") do |csv|
      csv << data
    end
    puts "..done."
  end


end
