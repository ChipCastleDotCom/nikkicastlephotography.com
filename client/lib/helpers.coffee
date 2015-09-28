UI.registerHelper 'carouselPhoto', (carousel) ->
  id = carousel.value.photo
  item = CarouselPhotos.findOne _id: id
  if item
    item.url store: 'carouselphotos'

UI.registerHelper 'photo', (options) ->
  id = options.hash.id if options and options.hash
  thumb = options.hash.thumb if options and options.hash
  type = options.hash.type if options and options.hash

  photo = undefined
  if type == 'carousel'
    photo = CarouselPhotos.findOne _id: id
  else if type == 'home'
    photo = HomePhotos.findOne _id: id
  else
    photo = ProductPhotos.findOne _id: id

  if photo
    store = if thumb then "#{type}thumbnails" else "#{type}photos"
    photo.url store: store

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
