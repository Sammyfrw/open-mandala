# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  showFields = (fields...) ->
    fields.forEach (field) -> field()

  tradeTicker = -> $("#trade_ticker_select").toggle()
  priceField = -> $("#price_field").toggle()
  comissionField = -> $("#comission_field").toggle()
  regFeeField = -> $("#reg_fee_field").toggle()
  strikeField = ->  $("#strike_field").toggle()
  expirationField = -> $("#expiration_field").toggle()


  $(document).on 'change', '#trade_types_select', (evt) ->
    $(".form_item").hide()
    trade_type_id = $("#trade_types_select option:selected").val()
    console.log(trade_type_id)
    console.log("THIS IS THE TRADE TYPE")
    if trade_type_id is "2" or
      trade_type_id is "10"
        showFields(tradeTicker, priceField)
    if trade_type_id is "3" or
      trade_type_id is "6"
        showFields(tradeTicker, priceField, comissionField, regFeeField)
    if trade_type_id is "4" or
      trade_type_id is "5" or
      trade_type_id is "7" or
      trade_type_id is "8"
        showFields(tradeTicker, priceField, comissionField, regFeeField, strikeField, expirationField)
    if trade_type_id is "11" or
      trade_type_id is "12" or
      trade_type_id is "13"
        showFields(tradeTicker, priceField, strikeField, expirationField)
    if trade_type_id is "14"
      showFields(tradeTicker, comissionField, regFeeField)
