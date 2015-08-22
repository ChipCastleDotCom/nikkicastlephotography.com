#FS.debug = true
@Images = new FS.Collection('images',
    stores: [new FS.Store.FileSystem('images', {})]
)
@Prints = new Meteor.Collection 'prints'

Schemas.Prints = new SimpleSchema
  filename:
    type: String
  media:
    type: String
    defaultValue: 'print'
    allowedValues: ['print', 'canvas']
  tags:
    type: String
  picture:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Images'

Prints.attachSchema(Schemas.Prints)
