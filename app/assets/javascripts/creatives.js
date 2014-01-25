var source   = $("#comment_template").html();
var template = Handlebars.compile(source);
function renderComment(data) {
    var html = template(data);
    $(".comments").prepend(html);
}
$("form").on('ajax:success',
    function(e, data, textStatus, jqXHR) {
      renderComment(data);
    });