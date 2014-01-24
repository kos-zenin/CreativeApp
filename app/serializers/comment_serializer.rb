class CommentSerializer < ActiveModel::Serializer
  attributes :body, :date, :user
  GUEST_USERNAME = "Guest"

  def user
    object.user.present? ? object.user.email : GUEST_USERNAME
  end

  def date
    object.updated_at.to_formatted_s(:short)
  end
end
