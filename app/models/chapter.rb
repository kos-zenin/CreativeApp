class Chapter < ActiveRecord::Base
	belongs_to :creative, :inverse_of  => :chapters
end
