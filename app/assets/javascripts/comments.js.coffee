$ ->
  getComments = ->
    comments_url = $(".creative").data("comments")
    $.getJSON comments_url, (data) ->
      data.forEach renderComment

  renderComment = (data) ->
    html = template(data)
    $(".comments").prepend html
  if $(".creative").length
    source = $("#comment_template").html()
    template = Handlebars.compile(source)
    getComments()
    $("form").on "ajax:success", (e, data, textStatus, jqXHR) ->
      $("form")[0].reset()
      getComments()
  $(".wmd-input").onchange = ->
    alert 1