# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(document).on 'change', '#trade_types_select', (evt) ->
    $.ajax 'update_trade_form',
      type: 'GET'
      dataType: 'script'
      data: {
        trade_type_id: $("#trade_types_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic Trade Select OK!")
        console.log(data)
