# == Schema Information
#
# Table name: chapters
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  number      :integer
#  body        :text
#  creative_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Chapter < ActiveRecord::Base
	belongs_to :creative, :inverse_of  => :chapters

	def parent
    self.creative
  end

end