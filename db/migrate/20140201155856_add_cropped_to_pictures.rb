class AddCroppedToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :cropped, :boolean
  end
end
