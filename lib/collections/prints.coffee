#FS.debug = true
@Images = new FS.Collection('images',
    stores: [new FS.Store.FileSystem('images', {})]
)
@Prints = new Meteor.Collection 'prints'

Schemas.Prints = new SimpleSchema
  picture:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'Images'

Prints.attachSchema(Schemas.Prints)
