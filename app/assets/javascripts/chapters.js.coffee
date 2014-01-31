$ ->
	$(".addimagebutton").click ->
		txt = $.trim($(this).attr('url'))
		box = $(".wmd-input")
		box.val box.val() + "![](#{txt})"
		converter = Markdown.getSanitizingConverter()
		$("#wmd-preview").html converter.makeHtml($(".wmd-input").val())