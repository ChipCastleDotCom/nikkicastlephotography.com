@HomeItems = new Meteor.Collection 'homeitems'

Schemas.HomeItems = new SimpleSchema
  photo:
    type: String
    label: 'Choose file'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'HomePhotos'

HomeItems.attachSchema(Schemas.HomeItems)
