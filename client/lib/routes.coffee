Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading'

Router.map ->
  @route 'home',
    path: '/'
  @route 'about'
  @route 'photos',
    waitOn: ->
      Meteor.subscribe 'products'
  @route 'contact'
  @route 'thankYou'
  @route 'login'
  @route 'logout', ->
    Meteor.logout (err) ->
      if err
        console.log 'Error logging out'
      Router.go '/'
      return
    @render 'logout'
    return
  @route 'manageCarouselItems',
    waitOn: ->
      [
        Meteor.subscribe 'carouselitems'
        Meteor.subscribe 'carouselphotos'
      ]
  @route 'manageProducts',
    waitOn: ->
      [
        Meteor.subscribe 'products'
        Meteor.subscribe 'productphotos'
      ]

requireLogin = () ->
  if !Meteor.userId()
    @render 'login'
  else
    @next()
  return

Router.onBeforeAction requireLogin, only: ['manageProducts', 'manageCarouselItems']

Accounts.onLogin ->
  Router.go 'manageProducts'
