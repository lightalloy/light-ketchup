# $ = jQuery
$(document).ready ->
  # console.log("Loaded application")
  $('.tag .delete').click ->
    id = $(@).data('entry-id')
    console.log(id)
    form = $(@).parent()
    $.ajax
      url: form.attr('action')
      type: 'DELETE'
      data: {
        _csrf_token: form.find("[name='_csrf_token']").val()
      }
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->

        alert("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        form.parent().remove()
    false



    # $('.notification .delete').click ->
    #   $(@).parent().remove()
