class Creative < ActiveRecord::Base
	has_many :chapters, :inverse_of  => :creative
	has_many :comments
end
