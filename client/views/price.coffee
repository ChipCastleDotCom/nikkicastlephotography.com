Template.price.helpers
  price: ->
    menu = NikkiApp.products.get @._id
    service = NikkiApp.productService media: menu.media, size: menu.size
    numeral(service.amount() * menu.quantity).format('$0,0.00')
