class CommentSerializer < ActiveModel::Serializer
  attributes :body, :date, :user

  def user
    object.user.nickname.present? ? object.user.nickname : object.user.email
  end

  def date
    object.updated_at.to_formatted_s(:short)
  end
end
