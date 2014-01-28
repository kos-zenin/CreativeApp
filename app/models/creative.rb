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
end
