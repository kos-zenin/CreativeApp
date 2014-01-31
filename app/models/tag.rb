class Tag < ActiveRecord::Base
	has_many :creatives, :through => :taggings, :source => :taggable, :source_type => "Creative"

	has_many :pictures, :through => :taggings, :source => :taggable, :source_type => "Picture"

	has_many :taggings	
end
