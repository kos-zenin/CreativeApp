$(function() {
  if ($('.creative').length) {
    var source   = $("#comment_template").html();
    var template = Handlebars.compile(source);
  $('form').on('ajax:success',
    function(e, data, textStatus, jqXHR) {
      getComments();
      $('form')[0].reset();
  });
  }

  function getComments() {
  	var comments_url = $('.creative').data('comments')
    $.getJSON(comments_url, function(data) {
      data.forEach(renderComment);
    })
  }

  function renderComment(data) {
    var html = template(data);
    $(".comments").prepend(html);
  }

});