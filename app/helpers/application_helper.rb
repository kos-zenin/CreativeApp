module ApplicationHelper
	
	def tag_list(model)
		t = model.tags.map {|tag| link_to tag.name, search_path(tag.name), :class => "label radius" }
    t.join(' ')
	end

end
