$ ->
  $("#fileupload").fileupload(acceptFileTypes: /(\.|\/)(jpg|png|gif|jpeg)$/i).bind "fileuploadadded", (e, data) ->
    console.log data.files.valid

  $("#fileupload").fileupload paramName: "picture[file]"

  $.getJSON $("#fileupload").prop("action"), (files) ->
    fu = $("#fileupload").data("blueimpFileupload")
    template = undefined
    fu._adjustMaxNumberOfFiles -files.length
    console.log files
    template = fu._renderDownload(files).appendTo($("#fileupload .files"))

    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    $("#loading").remove()


  $(document).foundation()