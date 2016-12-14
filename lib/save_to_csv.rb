require 'csv'

class SaveToCSV

  def add_data(data)
    CSV.open("police_calls.csv", "a+") do |csv|
      csv << data
    end
  end
end
