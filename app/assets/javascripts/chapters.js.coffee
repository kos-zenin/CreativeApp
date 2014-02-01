$ ->
	$(".wmd-input").bind "change keyup input", ->
		delay (->
			$('form.chapter_save').submit();
			$(".foundicon-checkmark").fadeIn 5
			$(".foundicon-checkmark").delay(1000).fadeOut 5
	  ), 1000

	delay = (->
  	timer = 0
  	(callback, ms) ->
  	  clearTimeout timer
  	  timer = setTimeout(callback, ms)
		)()

	refreshPage = ->
	  page_y = document.getElementsByTagName("body")[0].scrollTop
	  window.location.href = window.location.href.split("?")[0] + "?page_y=" + page_y
	window.onload = ->
	  unless window.location.href.indexOf("page_y") is -1
	    match = window.location.href.split("?")[1].split("&")[0].split("=")
	    document.getElementsByTagName("body")[0].scrollTop = match[1]