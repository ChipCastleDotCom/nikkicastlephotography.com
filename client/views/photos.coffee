Template.photos.helpers
  images: ->
    CarouselItems.find().fetch()

Template.photos.onRendered ->
  $.backstretch 'destroy', false
  $('.carousel').carousel()
  return
