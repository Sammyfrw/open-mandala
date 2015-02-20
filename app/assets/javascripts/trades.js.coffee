# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  $(document).on 'change', '#trade_types_select', (evt) ->
    $(".form_item").hide()
    tradeTypeID = $("#trade_types_select option:selected").val()
    checkTradeType(tradeTypeID)

  checkTradeType = (tradeTypeId) ->
    if (tradeTypeId in ["2", "10"])
        showFields(tradeTicker, priceField)
    if (tradeTypeId in ["3", "6"])
      showFields(tradeTicker, priceField, comissionField, regFeeField)
    if (tradeTypeId in ["4", "5", "7", "8"])
      showFields(tradeTicker, priceField, comissionField, regFeeField, strikeField, expirationField)
    if (tradeTypeId in ["11", "12", "13"])
      showFields(tradeTicker, priceField, strikeField, expirationField)
    if tradeTypeId is "14"
      showFields(tradeTicker, comissionField, regFeeField)

  showFields = (fields...) ->
    fields.forEach (field) -> field()

  tradeTicker = -> $("#trade_ticker_select").toggle()
  priceField = -> $("#price_field").toggle()
  comissionField = -> $("#comission_field").toggle()
  regFeeField = -> $("#reg_fee_field").toggle()
  strikeField = ->  $("#strike_field").toggle()
  expirationField = -> $("#expiration_field").toggle()
