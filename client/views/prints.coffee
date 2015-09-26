Template.prints.helpers
  products: ->
    Products.find()

Template.prints.onRendered ->
  $.backstretch 'destroy', false
  simpleCart.update()

  #simpleCart.bind 'beforeAdd', (item) ->
    #console.log 'beforeAdd'
    #console.log item.get 'id'
    #return
