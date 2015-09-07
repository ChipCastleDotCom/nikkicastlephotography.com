NikkiApp.products = new ReactiveDict()

Template.prints.events
  'change .item_thickness': (event) ->
    console.log 'item_thickness change'

  #'change .item_size': (event) ->
    ## Fetch size menu value
    #$ele = $(event.currentTarget)
    #size = $ele.val()
    #console.log 'size: ', size

    ## Fetch cart shelf item
    #$shelfItem = $ele.closest('.simpleCart_shelfItem').clone()

    ## Fetch media
    #$mediaEle = $shelfItem.find('.item_media')
    #media = $mediaEle.html()
    #console.log 'media ', media

    ## Fetch quantity
    #$quantityEle = $shelfItem.find('.item_quantity')
    #quantity = $quantityEle.html()
    #console.log 'quantity ', quantity

    #product = NikkiApp.productService(media: media, size: size)
    #console.log 'product.amount ', product.amount()
    #total = numeral(product.amount() * quantity).format('$0,0.00')
    #console.log 'total ', total

    # Fetch price (for dom update)
    #$shelfItem.find('.item_price').html(total)

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

  simpleCart.bind 'beforeCheckout', (data) ->
    console.log 'beforeCheckout'
    console.dir data
    return

Template.prints.onCreated ->
  console.log 'prints onCreated'
