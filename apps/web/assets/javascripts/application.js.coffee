# $ = jQuery
$(document).ready ->
  # console.log("Loaded application")
  $('.tag .delete').click ->
    id = $(@).data('entry-id')
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

  # $('#tomato-add').click ->
  #   form = $('#time_entry-form')
  #   $.ajax
  #     url: form.attr('action')
  #     type: 'POST'
  #     data: {
  #       time_entry: {
  #         date: form.find('#time-entry-date').val()
  #         minutes: form.find('#time-entry-minutes').val()
  #       }
  #       _csrf_token: form.find("[name='_csrf_token']").val()
  #     }
  #     dataType: 'json'
  #     error: (jqXHR, textStatus, errorThrown) ->
  #       alert("AJAX Error: #{textStatus}")
  #     success: (data, textStatus, jqXHR) ->
  #       console.log(data)
  #       alert(data)
  #   false

