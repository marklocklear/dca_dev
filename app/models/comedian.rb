class Comedian < ActiveRecord::Base
	has_many :shots
  attr_accessible :name, :twitter
end
