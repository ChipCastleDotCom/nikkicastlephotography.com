Router.configure
  layoutTemplate: 'layout',
  loadingTemplate: 'loading'

Router.map ->
  @route 'home',
    path: '/'
  @route 'about',
    path: '/about'
  @route 'photos',
    path: '/photos'
  @route 'contact',
    path: '/contact'
  @route 'adminLogin',
    path: '/adminLogin'
  @route 'images',
    waitOn: ->
      Meteor.subscribe 'images'
  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()
      return
