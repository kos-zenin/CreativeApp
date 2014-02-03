# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  user_id     :integer
#  creative_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
	belongs_to :creative
	belongs_to :user

	 def self.create_by_user(params, user)
    comment = self.new(params)
    comment.user = user
    comment.save
    comment
  end
end
