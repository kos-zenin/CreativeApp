$ ->
  getComments = ->
    comments_url = $(".creative").data("comments")
    $(".comments").html('')
    $.getJSON comments_url, (data) ->
      data.forEach renderComment

  renderComment = (data) ->
    html = template(data)
    $(".comments").prepend html
  if $(".creative").length
    source = $("#comment_template").html()
    template = Handlebars.compile(source)
    getComments()
    $("form.new_comment").on "ajax:success", (e, data, textStatus, jqXHR) ->
      $("form.new_comment")[0].reset()
      getComments()
