#FS.debug = true
imageStore = new FS.Store.FileSystem('images',
  transformWrite: (fileObj, readStream, writeStream) ->
    gm(readStream, fileObj.name()).size {bufferStream: true}, (err, size) ->
      if err
        console.log 'error with getting image size'
        console.log err
      x = 5
      y = 5
      y = size.height - 5 if size and size.height
      text = 'Nikki Castle Photography'
      @fill('white').drawText(x, y, text).stream().pipe writeStream
      return
    return
)
@Images = new FS.Collection 'images', stores: [imageStore]
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
