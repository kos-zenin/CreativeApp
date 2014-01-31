class Picture < ActiveRecord::Base
	belongs_to :creative, :inverse_of  => :pictures
	has_many :tags, :through => :taggings
	has_many :taggings, :as => :taggable

	mount_uploader :file, FileUploader

	def to_jq_upload
	  {
	    "name" => read_attribute(:file),
	    "size" => file.size,
	    "url" => file.url,
	    "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
	    "delete_type" => "DELETE",
	   	"edit_url" => "/creatives/#{creative_id}/pictures/#{id}/edit",
	    "edit_type" => "GET"
	  }
	end
	def to_jq_download
	  {
	    "name" => read_attribute(:file),
	    "size" => file.size,
	    "thumbnail_url" => file.thumb.url,
	    "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
	    "delete_type" => "DELETE",
	    "edit_url" => "/creatives/#{creative_id}/pictures/#{id}/edit",
	    "edit_type" => "GET"
	  }
	end
end
