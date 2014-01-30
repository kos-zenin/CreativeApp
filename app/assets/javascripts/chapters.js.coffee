$ ->
	$(".addimagebutton").click ->
		txt = $.trim($(this).attr('url'))
		box = $(".wmd-input")
		box.val box.val() + "![](#{txt})"