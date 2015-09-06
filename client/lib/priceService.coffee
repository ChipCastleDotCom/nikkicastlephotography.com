NikkiApp.priceService = (spec) ->
  member = spec
  amount = ->
    '5.00'

  Object.freeze
    amount: amount
