Template.price.helpers
  price: ->
    console.log 'price helpers id ', @._id
    #product = NikkiApp.products.get @._id
    #console.log 'product'
    #console.dir product

    product = Template.instance().currentProduct.get()
    #console.log Template.instance().currentProduct.get()
    service = NikkiApp.productService media: product.media, size: product.size
    #console.log 'service'
    #console.dir service
    #console.log 'service.amount()'
    #console.dir service.amount()
    numeral(service.amount() * product.quantity).format('$0,0.00')
    #'8.00'
