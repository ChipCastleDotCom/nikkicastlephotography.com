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
  product = NikkiApp.products.get product._id
  service = NikkiApp.productService media: product.media, size: product.size
  numeral(service.amount()).format('$0,0.00')

UI.registerHelper 'sizesFor', (media) ->
  NikkiApp.productService(media: media).sizes()

UI.registerHelper 'thicknessFor', (media) ->
  NikkiApp.productService(media: media).thicknesses()
