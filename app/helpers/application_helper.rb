module ApplicationHelper
	
	def tag_list(model)
		tag_list_raw(model).html_safe
	end

	def tag_list_raw(model)
		model.tags.map {|tag| link_to tag.name, search_path(tag.name), :class => "label radius" }.join(' ')
	end

end
