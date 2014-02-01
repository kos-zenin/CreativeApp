$ ->
	$(".addimagebutton").click ->
		txt = $.trim($(this).attr('url'))
		box = $(".wmd-input")
		box.val box.val() + "![](#{txt})"
		converter = Markdown.getSanitizingConverter()
		$("#wmd-preview").html converter.makeHtml($(".wmd-input").val())

	$(".wmd-input").bind "change keyup input", ->
		delay (->
			$('form.edit_chapter').submit();
			$(".foundicon-checkmark").fadeIn 5
			$(".foundicon-checkmark").delay(1000).fadeOut 5
	  ), 1000


	delay = (->
  	timer = 0
  	(callback, ms) ->
  	  clearTimeout timer
  	  timer = setTimeout(callback, ms)
		)()