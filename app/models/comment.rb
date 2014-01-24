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
