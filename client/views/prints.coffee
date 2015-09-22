Template.prints.helpers
  products: ->
    Products.find()

Template.prints.onRendered ->
  $.backstretch 'destroy', false
  simpleCart.update()
