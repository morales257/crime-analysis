class Neighborhood < ActiveRecord::Base
  acts_as_mappable :default_units => :kms

  serialize :coordinates

end
