$ ->
	getSelText = ->
	  txt = ""
	  if window.getSelection
	    txt = window.getSelection()
	  else if document.getSelection
	    txt = document.getSelection()
	  else txt = document.selection.createRange().text  if document.selection
	  txt
	shortcut.add "Ctrl+Enter", ->
  txt = ""
  if window.getSelection
    txt = window.getSelection()
  else if document.getSelection
    txt = document.getSelection()
  else txt = document.selection.createRange().text  if document.selection
  txt = $.trim(txt)
  alert txt  unless txt is ""