ThinkingSphinx::Index.define :creative, :with => :active_record do
  # fields
  indexes name, :sortable => true, :enable_star => 1, :min_infix_len => 3
  indexes description, :enable_star => 1, :min_infix_len => 3
  indexes user.nickname, :as => :author, :sortable => true
  # attributes
  has user_id, created_at, updated_at
end
