require 'test_helper'
require 'neighborhood_test_helper'


class NeighborhoodTest < ActiveSupport::TestCase
  # include NeighborhoodTestHelper
  #
   def setup
     @crime = crimes(:arrest)
     @neighborhood = neighborhoods(:one)
   end

   test "neighborhood needs a name" do
     @neighborhood.name = ""
     assert_not @neighborhood.valid?
   end
end
