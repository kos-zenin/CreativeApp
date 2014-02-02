ThinkingSphinx::Index.define :chapter, :with => :active_record do
  # fields
  indexes name
  indexes body
  
  # attributes
  has creative_id, number, created_at, updated_at
end