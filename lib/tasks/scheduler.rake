require 'toronto_police_calls'

namespace :crime_data do
  desc "Scrape Police Calls To Service For Crime Reports"
  task police_calls: :environment do
    PoliceCalls.new.fetch_calls
  end

end
