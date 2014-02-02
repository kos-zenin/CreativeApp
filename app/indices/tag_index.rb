ThinkingSphinx::Index.define :tag, :with => :active_record do
  # fields
  indexes name, :enable_star => 1, :min_infix_len => 3
  # attributes
  has created_at, updated_at
end