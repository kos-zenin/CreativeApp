$(function() {
  if ($('.creative').length) {
    var source   = $("#comment_template").html();
    var template = Handlebars.compile(source);

    addCommentsPossibility();
    getComments();
  }

  function addCommentsPossibility() {
    $('form').on('ajax:success',
      function(e, data, textStatus, jqXHR) {
        $('form #comment_body').val('');
        renderComment(data);
        $('form input[type=submit]').prop("disabled", false);
        $('#comment_body').prop("disabled", false);
        $('.creative').remove();
      })
        .on('ajax:send', function() {
          $('.creative').append(spinner.el);
          $('form input[type=submit]').prop("disabled", true);
          $('#comment_body').prop("disabled", true);
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