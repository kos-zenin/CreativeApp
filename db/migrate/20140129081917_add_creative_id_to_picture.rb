class AddCreativeIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :creative_id, :integer
  end
end
