class CreateMistakes < ActiveRecord::Migration
  def change
    create_table :mistakes do |t|
      t.string :mistake_text
      t.integer :creative_id

      t.timestamps
    end
  end
end
