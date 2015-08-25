Template.photos.helpers
  images: ->
    Images.find()

Template.photos.onRendered ->
  $.backstretch 'destroy', false
  $('#carousel').slick
    autoplay: true
    autoplaySpeed: 5000
    speed: 2000
    slidesToShow: 1
    slidesToScroll: 1
    fade: true
    dots: true
    accessibility: true
    mobileFirst: true
  return
