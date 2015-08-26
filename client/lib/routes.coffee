Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading'

Router.map ->
  @route 'home',
    path: '/'
  @route 'about'
  @route 'photos',
    waitOn: ->
      Meteor.subscribe 'images'
  @route 'contact'
  @route 'login'
  @route 'logout', ->
    Meteor.logout (err) ->
      if err
        console.log 'Error logging out'
      Router.go '/'
      return
    @render 'logout'
    return
  @route 'manageCarouselPhotos',
    waitOn: ->
      Meteor.subscribe 'carouselphotos'
  @route 'manageProducts',
    waitOn: ->
      Meteor.subscribe 'products'

requireLogin = () ->
  if !Meteor.userId()
    @render 'login'
  else
    @next()
  return

Router.onBeforeAction requireLogin, only: ['manageProducts', 'manageCarouselPhotos']

Accounts.onLogin ->
  Router.go 'manageProducts'
