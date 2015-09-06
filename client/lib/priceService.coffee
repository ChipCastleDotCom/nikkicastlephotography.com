NikkiApp.priceService = ({media, size, thickness} = {media: 'print', size: '18x24', thickness: '0.75'}) ->
  amount = ->
    if media == 'print' then '3.00' else '5.00'

  Object.freeze
    amount: amount
