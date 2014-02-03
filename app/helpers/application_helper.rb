module ApplicationHelper
	
	def tag_list(model)
		tag_list_raw(model).html_safe
	end

	def tag_list_raw(model)
		model.tags.map {|tag| link_to tag.name, search_path(tag.name), :class => "label radius" }.join(' ')
	end

	def creatives_list(models)
		models.map {|m| link_to m.name, creative_path(m), :class => "label secondary round big-text" }.join(' ').html_safe
	end

end
