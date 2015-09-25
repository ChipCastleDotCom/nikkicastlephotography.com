UI.registerHelper 'productPhoto', (product, thumbnail) ->
  id = product.photo
  console.log 'id ', id
  console.log 'productPhoto thumbnail'
  console.dir thumbnail
  photo = ProductPhotos.findOne _id: id
  console.dir photo
  if photo
    store = if thumbnail.hash.thumb then 'productthumbnails' else 'productphotos'
    photo.url(store: store)

UI.registerHelper 'carouselPhoto', (carousel, thumbnail) ->
  id = carousel._id
  console.log id
  #photo = CarouselPhotos.findOne _id: id
  item = CarouselItems.findOne _id: id
  console.log 'carouselPhoto thumbnail'
  console.dir thumbnail
  console.log 'carouselPhoto item'
  console.dir item
  if item
    store = if thumbnail.hash.thumb then 'carouselthumbnails' else 'carouselphotos'
    console.log 'store'
    console.log store
    item.url(store: store)

UI.registerHelper 'isCarouselPhoto', (photoType) ->
  console.log 'isCarouselPhoto '
  console.dir @
  console.log photoType == 'carousel'
  photoType == 'carousel'

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

UI.registerHelper 'sizesFor', (product) ->
  NikkiApp.productService(media: product.media).sizes()

UI.registerHelper 'hasMediaTypesAvailableFor', (product) ->
  mediaTypesAvailable = NikkiApp.mediaService(product: product).typesAvailable()
  mediaTypesAvailable.length > 0

UI.registerHelper 'mediaTypesAvailableFor', (product) ->
  NikkiApp.mediaService(product: product).typesAvailable()
