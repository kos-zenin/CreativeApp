$ ->
	shortcut.add "Ctrl+Enter", ->
  txt = ""
  if window.getSelection
    txt = window.getSelection()
  else if document.getSelection
    txt = document.getSelection()
  else txt = document.selection.createRange().text  if document.selection
  txt = $.trim(txt)
  unless txt is "" 
  	$.post $("#chapter-read").attr("data-url")+"?mistake_text="+txt, (data) ->
	  	escape data