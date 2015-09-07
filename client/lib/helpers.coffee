UI.registerHelper 'productPhoto', (product, thumbnail) ->
  id = product.photo
  photo = ProductPhotos.findOne _id: id
  if photo
    store = if thumbnail.hash.thumb then 'productthumbnails' else 'productphotos'
    photo.url(store: store)

UI.registerHelper 'carouselPhoto', (carouselItem, thumbnail) ->
  id = carouselItem.photo
  photo = CarouselPhotos.findOne _id: id
  if photo
    store = if thumbnail.hash.thumb then 'carouselthumbnails' else 'carouselphotos'
    photo.url(store: store)

UI.registerHelper 'addIndex', (all) ->
  _.map all, (val, index) ->
    {
      index: index
      value: val
    }

UI.registerHelper 'firstIndex', (index) ->
  index == 0

UI.registerHelper 'cssClass', (index) ->
  if index == 0 then 'active' else ''

UI.registerHelper 'priceFor', (product) ->
  #console.log 'priceFor '
  #console.dir product
  $ele = $('.' + product._id)
  media = product.media
  size = $ele.find('.item_size').val() or ''
  #console.log 'size: ', size
  quantity = $ele.find('.item_quantity').html() or '3'
  #console.log 'quantity: ', quantity
  product = NikkiApp.productService media: media, size: size
  numeral(product.amount() * quantity).format('$0,0.00')

UI.registerHelper 'sizesFor', (media) ->
  NikkiApp.productService(media: media).sizes()

UI.registerHelper 'thicknessFor', (media) ->
  NikkiApp.productService(media: media).thicknesses()
