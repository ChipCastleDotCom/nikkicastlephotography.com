Template.price.onCreated ->
  console.log 'price onCreated'
  console.dir @data
  menu = NikkiApp.products.get @data._id

Template.price.helpers
  price: ->
    menu = NikkiApp.products.get @._id
    product = NikkiApp.productService media: menu.media, size: menu.size
    product.amount()
