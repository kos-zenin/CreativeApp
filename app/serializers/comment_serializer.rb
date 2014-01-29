class CommentSerializer < ActiveModel::Serializer
  attributes :body, :date, :user, :delete_link

  def user
    object.user.nickname.present? ? object.user.nickname : object.user.email
  end

  def date
    object.updated_at.to_formatted_s(:short)
  end
  def delete_link
		ActionController::Base.helpers.link_to 'delete', creative_comments_path({id: object.id}), method: :delete		
  end
end
