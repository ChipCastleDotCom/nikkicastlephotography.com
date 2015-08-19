@Prints = new Meteor.Collection('prints');

Schemas.Prints = new SimpleSchema
  filename:
    type:String
    max: 60

  orientation:
    type: String
    max: 20

  createdAt:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type:Date
    optional:true
    autoValue: ->
      if this.isUpdate
        new Date()

  picture:
    type: String
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Attachments'

  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

Prints.attachSchema(Schemas.Prints)
