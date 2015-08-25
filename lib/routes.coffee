loginRedirect = (newRoute) ->
  if !Meteor.userId()
    @redirect '/login'
  @next()
  return

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
  @route 'photos'
  @route 'contact'
  @route 'login'
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

Router.onBeforeAction loginRedirect, only: ['login']

if Meteor.isClient
  Accounts.onLogin ->
    Router.go 'adminPanel'
