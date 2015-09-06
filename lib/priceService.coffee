console.log 'lib/priceService.coffee'

if Meteor.isClient
  NikkiApp.priceService = ->
    Object.freeze
      amount: ->
        '5.00'
