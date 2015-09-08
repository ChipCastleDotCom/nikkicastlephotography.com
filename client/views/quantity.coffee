Template.quantity.events
  'keyup .item_quantity': (evt) ->
    name = $(evt.currentTarget).data 'quantity-trigger'
    quantity = $(evt.currentTarget).val()
    menu = NikkiApp.products.get name
    opts = _.extend menu, quantity: quantity
    NikkiApp.products.set name, opts

Template.quantity.onRendered ->
  $('.item_quantity').numeric()
