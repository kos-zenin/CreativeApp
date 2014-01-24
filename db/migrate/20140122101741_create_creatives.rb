class CreateCreatives < ActiveRecord::Migration
  def change
    create_table :creatives do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
