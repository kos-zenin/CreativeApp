# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/creative_#{model.creative_id}/#{model.id}"
  end

  
  
  process :resize_to_fit => [1024,1024]
    
  version :thumb do
    
    process :resize_to_fill => [200,150]
  
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
