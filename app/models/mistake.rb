# == Schema Information
#
# Table name: mistakes
#
#  id           :integer          not null, primary key
#  mistake_text :string(255)
#  creative_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Mistake < ActiveRecord::Base
	belongs_to :creative
end
