class Crime < ActiveRecord::Base
  validates :objid, uniqueness: true
end
