$("#trade_select")
  .empty()
  .append("<%= escape_javascript(render partial: "trade_type", collection: @trade_typse) %>")
