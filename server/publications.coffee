Meteor.publish 'products', ->
  Products.find()

Meteor.publish 'productphotos', ->
  ProductPhotos.find()

Meteor.publish 'carouselitems', ->
  CarouselItems.find()

Meteor.publish 'carouselphotos', ->
  CarouselPhotos.find()

Meteor.publish 'prices', ->
  Prices.find()
