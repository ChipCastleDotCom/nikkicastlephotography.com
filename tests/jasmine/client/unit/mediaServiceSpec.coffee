describe 'mediaService', ->

  describe 'typesAvailable', ->

    it 'expect default to return ["print", "canvas"]', ->
      service = NikkiApp.mediaService()
      expect(service.typesAvailable()).toEqual ['print', 'canvas']

    it 'expect empty product to return ["print", "canvas"]', ->
      service = NikkiApp.mediaService product: {}
      expect(service.typesAvailable()).toEqual ['print', 'canvas']

    it 'expect product with postcard: true attribute to return ["print", "canvas", "postcard"]', ->
      service = NikkiApp.mediaService product: {postcard: true}
      expect(service.typesAvailable()).toEqual ['print', 'canvas', 'postcard']

    it 'expect product with bookmark: true attribute to return ["print", "canvas", "bookmark"]', ->
      service = NikkiApp.mediaService product: {bookmark: true}
      expect(service.typesAvailable()).toEqual ['print', 'canvas', 'bookmark']

    it 'expect product with postcard: true, bookmark: true to return ["print", "canvas", "postcard", "bookmark"]', ->
      service = NikkiApp.mediaService product: {postcard: true, bookmark: true}
      expect(service.typesAvailable()).toEqual ['print', 'canvas', 'postcard', 'bookmark']

    it 'expect product with bookmark: false attribute to return ["print", "canvas"]', ->
      service = NikkiApp.mediaService product: {bookmark: false}
      expect(service.typesAvailable()).toEqual ['print', 'canvas']

    it 'expect product with postcard: false attribute to return ["print", "canvas"]', ->
      service = NikkiApp.mediaService product: {postcard: false}
      expect(service.typesAvailable()).toEqual ['print', 'canvas']

    return

  return
