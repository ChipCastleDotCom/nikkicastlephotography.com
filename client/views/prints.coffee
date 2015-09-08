NikkiApp.products = new ReactiveDict()

Template.prints.helpers
  products: ->
    Products.find()

Template.prints.onRendered ->

  simpleCart.bind 'update', ->
    console.log simpleCart.grandTotal()
    return

  simpleCart.bind 'beforeAdd', (item) ->
    console.log 'Item name: ', item.get('name')
    console.dir item
    return

  simpleCart.bind 'beforeCheckout', (data) ->
    console.log 'beforeCheckout'
    console.dir data
    return

  $.backstretch 'destroy', false

  simpleCart.load()
