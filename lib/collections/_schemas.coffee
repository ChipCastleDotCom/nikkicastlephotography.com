@Schemas = {}

FS.debug = false

addWatermark = (fileObj, readStream, writeStream) ->
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

createThumb = (fileObj, readStream, writeStream) ->
  # Transform the image into a 100x100px thumbnail
  gm(readStream, fileObj.name()).resize('100', '100').stream().pipe writeStream
  return

@Photos = new FS.Collection 'photos', stores: [
  new FS.Store.FileSystem 'thumbnails', transformWrite: createThumb,
  new FS.Store.FileSystem 'photos', transformWrite: addWatermark
]
