ThinkingSphinx::Index.define :chapter, :with => :active_record do
  # fields
  indexes name, :enable_star => 1, :min_infix_len => 3
  indexes body :enable_star => 1, :min_infix_len => 3
  
  # attributes
  has creative_id, number, created_at, updated_at
end