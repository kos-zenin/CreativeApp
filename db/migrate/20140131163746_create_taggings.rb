class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps
    end
    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  end
end
