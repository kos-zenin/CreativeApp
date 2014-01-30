$ ->
  $("#fileupload").fileupload(acceptFileTypes: /(\.|\/)(jpg|png|gif|jpeg)$/i).bind "fileuploadadded", (e, data) ->
    console.log data.files.valid

  $(document).foundation()