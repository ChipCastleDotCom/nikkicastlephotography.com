#FS.debug = true
imageStore = new FS.Store.FileSystem('images',
  transformWrite: (fileObj, readStream, writeStream) ->
    getSize = (callback) ->
      console.log 'getSize'

      gm(readStream).size (err, size) ->
        console.log 'gm.size() ', size
        callback err, size
        return
      return

    getSizeSync = Meteor.wrapAsync(getSize, @)
    getSizeSync (err, size) ->
      console.log 'inside getSizeSync '
      console.log 'err ', err
      console.log 'size ', size

      x = 10
      y = 10
      y = size.height - 10 if size and size.height
      text = 'Nikki Castle Photography'
      gm(readStream, fileObj.name())
        .fill('white')
        .drawText(x, y, text)
        .stream()
        .pipe writeStream
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
