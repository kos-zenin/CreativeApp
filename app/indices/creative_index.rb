ThinkingSphinx::Index.define :creative, :with => :active_record do
  # fields
  indexes name, :sortable => true
  indexes description
  
  # attributes
  has user_id, created_at, updated_at
end
