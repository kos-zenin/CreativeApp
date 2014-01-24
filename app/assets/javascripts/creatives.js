$(function() {
  var spinner = new Spinner(spinnerOptions).spin();

  if ($('.creative').length) {
    var source   = $("#comment_template").html();
    var template = Handlebars.compile(source);

    addCommentsSpinner();
    addCommentsPossibility();
    getComments();
  }

  function addCommentsSpinner() {
    $('.comments').append(spinner.el);
  }

  function addCommentsPossibility() {
    $('form').on('ajax:success',
      function(e, data, textStatus, jqXHR) {
        $('form #comment_body').val('');
        renderComment(data);
        $('form input[type=submit]').prop("disabled", false);
        $('#comment_body').prop("disabled", false);
        $('.creative .spinner').remove();
      })
        .on('ajax:send', function() {
          $('.creative').append(spinner.el);
          $('form input[type=submit]').prop("disabled", true);
          $('#comment_body').prop("disabled", true);
        });
  }

  function getComments() {
    var comments_url = $('.creative').data('comments')
    var $spinner = $(['.', SPINNER_CLASS].join(''))
    $.getJSON(comments_url, function(data) {
      data.forEach(renderComment);
    })
     .done(function() {
       $spinner.remove();
     });
  }

  function renderComment(data) {
    var html = template(data);
    $(".comments").prepend(html);
  }

});