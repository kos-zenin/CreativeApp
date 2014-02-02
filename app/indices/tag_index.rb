ThinkingSphinx::Index.define :tag, :with => :active_record do
  # fields
  indexes name
  # attributes
  has created_at, updated_at
end