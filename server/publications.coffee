Meteor.publish 'carousel', ->
  Carousel.find()

Meteor.publish 'products', ->
  Products.find()

Meteor.publish 'photos', ->
  Photos.find()
