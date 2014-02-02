class Picture < ActiveRecord::Base
  mount_uploader :file, FileUploader
  belongs_to :creative, :inverse_of => :pictures
  
  has_many :tags, :through => :taggings
  has_many :taggings, :as => :taggable  
  attr_reader :tag_tokens, :cropped_url

  def tag_tokens=(ids)
    self.tag_ids = Tag.ids_from_tokens(ids)
  end

  def cropped_url
    self.file.url + ".cropped.jpg"
  end

  def thumb_cropped_url
    self.file.thumb.url + ".cropped.jpg"
  end
  
  def tag_list
    t = self.tags.map {|tag| "<a href='/?search=#{tag.name}' class='label radius'>#{tag.name}</a>" } 
    t.join(' ')
  end
  
  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "edit_url" => "/creatives/#{creative_id}/pictures/#{id}/edit",
      "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
      "delete_type" => "DELETE"
    }
  end
  
  def to_jq_download
    {
      "id" => id,
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "thumbnail_url" => file.thumb.url,
      "edit_url" => "/creatives/#{creative_id}/pictures/#{id}/edit",
      "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
      "delete_type" => "DELETE"

    }
  end
end
