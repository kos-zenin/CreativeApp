module ApplicationHelper
	
	def tag_list(model)
		model.tags.map {|tag| link_to tag.name, search_path(tag.name), :class => "label radius" }.join(' ')
	end

end
