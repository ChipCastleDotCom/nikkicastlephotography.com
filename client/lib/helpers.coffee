UI.registerHelper 'productPhoto', (product, store='productthumbnails') ->
  id = product.photo
  photo = ProductPhotos.findOne _id: id
  if photo
    console.dir photo
    console.log 'store ', store
    console.log 'photo.url()', photo.url()
    console.log photo.url store: store
    photo.url store: store

UI.registerHelper 'carouselPhoto', (carouselItem, thumbnail) ->
  id = carouselItem.photo
  photo = CarouselPhotos.findOne _id: id
  if photo
    console.dir photo
    console.log 'thumbnail '
    console.dir thumbnail
    store = (thumbnail.hash.thumb ? 'carouselthumbnails' : 'carouselphotos')
    console.log 'store ', store
    console.log 'photo.url()', photo.url()
    console.log photo.url store: store
    photo.url store: store
