# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
	has_many :pictures, :through => :taggings, :source => :taggable, :source_type => "Picture"
	has_many :creatives, :through => :taggings, :source => :taggable, :source_type => "Creative"

	has_many :taggings, :dependent => :destroy

  def self.tokens(query)
    tags = where("name like ?", "%#{query}%")
    tags.empty? ? [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}] : tags
  end

  def self.ids_from_tokens(tokens)
    (tokens.gsub(/<<<(.+?)>>>/) { create!(name: $1).id} || tokens).split(',')
  end

  def to_s
    name
  end

  def parent
    array = Array.new
    array << self.creatives if creatives.present?
    array << self.pictures.map {|pic| pic.creative } if pictures.present?
    array
  end
  #flattem!

end
