Template.prints.helpers
  products: ->
    Products.find()

Template.prints.onRendered ->
  $.backstretch 'destroy', false
  simpleCart.bind 'update', ->
    console.log 'Whoa, the cart total is now at ' + simpleCart.toCurrency(simpleCart.grandTotal()) + '! Nice!'
    return
  simpleCart.bind 'beforeAdd', (item) ->
    console.log 'Item name: ', item.get('name')
    console.dir item
    return
