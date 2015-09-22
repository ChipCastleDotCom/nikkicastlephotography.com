Template.quantity.events
  'keyup .item_quantity': (evt) ->
    id = $(evt.currentTarget).data 'quantity-trigger'
    quantity = $(evt.currentTarget).val()
    menu = NikkiApp.products.get id
    opts = _.extend menu, quantity: quantity
    NikkiApp.products.set id, opts

Template.quantity.onRendered ->
  $('.item_quantity').numeric()
