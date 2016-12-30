require 'aws-sdk'
require 'csv'
require 'open-uri'

class CrimeCSV

  def initialize
  end

  def find_csv
    crime_info = nil
    s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
    bucket = s3.bucket('crimeanalysis')

    bucket.objects.each do |item|
      crime_info = item.presigned_url(:get) if item.key.include?('csv')
    end

  end

#  def update_csv(file)
#    csv = open(file)
    #should keep track of last add
#   CSV.open(csv,"a") do |csv|
#     csv << ['test']
#   end
#  end


end
