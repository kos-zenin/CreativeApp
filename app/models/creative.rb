# == Schema Information
#
# Table name: creatives
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Creative < ActiveRecord::Base
	has_many :chapters, :inverse_of  => :creative
	has_many :comments
	has_many :pictures, :inverse_of  => :creative
  belongs_to :user
  has_many :tags, :through => :taggings
	has_many :taggings, :as => :taggable

	def author?(user)
    self.user == user
  end
end
