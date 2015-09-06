Template.prints.helpers
  products: ->
    Products.find()

Template.prints.events
  'change .item_thickness': (event) ->
    console.log 'item_thickness change'

  'change .item_size': (event) ->
    $ele = event.currentTarget
    console.log 'item_size change ', $ele

Template.prints.onRendered ->
  $.backstretch 'destroy', false

  simpleCart.bind 'update', ->
    console.log 'Whoa, the cart total is now at ' + simpleCart.toCurrency(simpleCart.grandTotal()) + '! Nice!'
    return

  simpleCart.bind 'beforeAdd', (item) ->
    console.log 'Item name: ', item.get('name')
    console.dir item
    return

  simpleCart.bind 'beforeCheckout', (data) ->
    console.log 'beforeCheckout'
    console.dir data
    return
