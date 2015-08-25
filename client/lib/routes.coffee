#appRoutes = ->
#  _.each Router.routes, (route) ->
#    type = Object.prototype.toString.call route
#    if type == "[object Function]"
#      console.log route.getName()
#  return

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
    console.log 'logout'
    Meteor.logout (err) ->
      console.log 'Meteor.logout'
      if err
        console.log 'Error logging out'
      Router.go '/'
      return
    console.log 'render logout'
    @render 'logout'
    return
  @route 'adminPanel',
    waitOn: ->
      Meteor.subscribe 'images'
  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()
      return

requireLogin = () ->
  console.log 'requireLogin'
  if !Meteor.userId()
    console.log 'render login'
    @render 'login'
  else
    console.log 'next()'
    @next()
  return

Router.onBeforeAction requireLogin, only: ['adminPanel']

Accounts.onLogin ->
  console.log 'onLogin'
  Router.go 'adminPanel'
