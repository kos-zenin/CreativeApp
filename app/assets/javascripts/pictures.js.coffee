$ ->
  updatevalues = undefined
  updatevalues = (c) ->
    par = undefined
    par = "?x=" + c.x + "&y=" + c.y + "&w=" + c.w + "&h=" + c.h
    $("#croppic").attr "data-params", par

  $("#fileupload").fileupload(acceptFileTypes: /(\.|\/)(jpg|png|gif|jpeg)$/i)

  $("#fileupload").fileupload paramName: "picture[file]"

  $("#upload_all").click ->
    $(".start button").each ->
      $(this).click()
    $(this).fadeOut 400

  $("#upload-field").click ->
    $("#upload_all").fadeIn 400

  $.getJSON $("#fileupload").prop("action"), (files) ->
    fu = $("#fileupload").data("blueimpFileupload")
    template = undefined
    fu._adjustMaxNumberOfFiles -files.length
    template = fu._renderDownload(files).appendTo($("#fileupload .files"))
    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    $("#loading").remove()

  $("#croppic").click ->
    params = $(this).attr('data-params')
    params += "&original="+$(this).attr('data-original')
    params += "&id="+$(this).attr('data-id')
    $.post $("#croppic").attr("data-url") + params, (data) ->
      escape data

  $("#retouchpic").click ->
    Caman "#example", ->
      @render ->
        image = @toBase64()
        $("#image").attr('value', image)
        $("form").last().submit()

  $("#change_source_to_crop").click ->
    $("#croppic").attr('data-original',$(this).attr('data-original'));
    url = $(this).attr('data-url')
    id = $(this).attr('data-id')
    $("#pic_container_" + id).html("<img id=\"target-"+id+"\">");
    $("#target-"+id).attr('src', url+"?"+new Date());
    $("#target-"+id).Jcrop onChange: updatevalues

  $("#change_source_to_original").click ->
    $("#croppic").attr('data-original',$(this).attr('data-original'));
    url = $(this).attr('data-url')
    id = $(this).attr('data-id')
    $("#pic_container_" + id).html("<img id=\"target-"+id+"\">");
    $("#target-"+id).attr('src', url+"?"+new Date());
    $("#target-"+id).Jcrop onChange: updatevalues