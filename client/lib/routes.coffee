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
  @route 'adminPanel',
    waitOn: ->
      Meteor.subscribe 'images'

requireLogin = () ->
  if !Meteor.userId()
    @render 'login'
  else
    @next()
  return

Router.onBeforeAction requireLogin, only: ['adminPanel']

Accounts.onLogin ->
  Router.go 'adminPanel'
