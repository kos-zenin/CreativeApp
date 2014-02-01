$ ->
	$("#creative_tag_tokens").tokenInput "/tags.json",
    theme: "facebook"
    crossDomain: false
    prePopulate: $(this).data("pre")
	