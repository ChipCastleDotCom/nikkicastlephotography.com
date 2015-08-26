Meteor.publish 'carouselphotos', ->
  CarouselPhotos.find()

Meteor.publish 'products', ->
  Products.find()
