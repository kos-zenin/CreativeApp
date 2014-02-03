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
$('#plustext').click ->
  resizeText 1
$('#minustext').click ->
  resizeText -1
resizeText = (multiplier) ->
  document.body.style.fontSize = "1.0em"  if document.body.style.fontSize is ""
  document.body.style.fontSize = parseFloat(document.body.style.fontSize) + (multiplier * 0.2) + "em"