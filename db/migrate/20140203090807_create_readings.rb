class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
    	t.integer :creative_id
    	t.integer :user_id
      t.timestamps
    end
  end
end
