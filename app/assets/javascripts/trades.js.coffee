# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(document).on 'change', '#trade_types_select', (evt) ->
    $(".form_item").hide()
    trade_type_id = $("#trade_types_select option:selected").val()
    console.log(trade_type_id)
    console.log("THIS IS THE TRADE TYPE")
    if trade_type_id is "1" or trade_type_id is "9"
      console.log("NO CHANGE")
    if trade_type_id == "2" or "10"
      $("#trade_ticker_select").toggle();
      $("#price_field").toggle()
    if trade_type_id == "3" or "6"
      $("#trade_ticker_select").toggle();
      $("#price_field").toggle();
      $("#comission_field").toggle();
      $("#reg_fee_field").toggle();
    if trade_type_id == "4" or "5" or "7" or "8"
      $("#trade_ticker_select").toggle();
      $("#price_field").toggle();
      $("#comission_field").toggle();
      $("#reg_fee_field").toggle();
      $("#strike_field").toggle();
      $("#expiration_field").toggle();
    if trade_type_id == "11" or "12" or "13"
      $("#trade_ticker_select").toggle();
      $("#price_field").toggle();
      $("#strike_field").toggle();
      $("#expiration_field").toggle();
    if trade_type_id == "14"
      $("#trade_ticker_select").toggle();
      $("#comission_field").toggle();
      $("#reg_fee_field").toggle();

    ###
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
    ###
