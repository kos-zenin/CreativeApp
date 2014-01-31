$ ->
	$("#mySpinner").hide()
	$("#mySpinner").html "<img src=\"/assets/465.GIF\"/>"
	$("#sortable-grid").sortable
	  opacity: 0.8
	  update: (event, ui) ->
	    $("#mySpinner").fadeIn 100
	    sortedParams = "?sorted=" + $("#sortable-grid").sortable("toArray")
	    $.post $("#sortable-grid").attr("data-url") + sortedParams, (data) ->
	      escape data
	$("#sortable-grid").disableSelection()