//= require markdown.converter
//= require markdown.sanitizer
//= require markdown.editor

$(function(){ 


if ($('.chapter').length) {
		var converter = Markdown.getSanitizingConverter();
		var editor = new Markdown.Editor(converter);
		editor.run();
}

$('.markdown-source').each(function() {
	var converter = Markdown.getSanitizingConverter();
	$( this ).html(converter.makeHtml($( this ).text()));
});
});
