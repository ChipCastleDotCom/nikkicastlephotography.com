describe 'productService', ->

  describe 'amount', ->

    it 'expect default amount to return 3.00', ->
      service = NikkiApp.productService()
      expect(service.amount()).toEqual '3.00'

    it 'expect empty string media amount to return 3.00', ->
      service = NikkiApp.productService(media: '')
      expect(service.amount()).toEqual '3.00'

    it 'expect undefined media amount to return 3.00', ->
      service = NikkiApp.productService(media: undefined)
      expect(service.amount()).toEqual '3.00'

    it 'expect funky media amount to return 3.00', ->
      service = NikkiApp.productService media: 'funky'
      expect(service.amount()).toEqual '3.00'

    it 'expect default print amount to return 3.00', ->
      service = NikkiApp.productService media: 'print'
      expect(service.amount()).toEqual '3.00'

    it 'expect wrong size print amount to return 3.00', ->
      service = NikkiApp.productService media: 'print', size: 'wrong'
      expect(service.amount()).toEqual '3.00'

    it 'expect 4x6 print amount to return 3.00', ->
      service = NikkiApp.productService media: 'print', size: '4x6'
      expect(service.amount()).toEqual '3.00'

    it 'expect 5x7 print amount to return 5.00', ->
      service = NikkiApp.productService media: 'print', size: '5x7'
      expect(service.amount()).toEqual '5.00'

    it 'expect 8x10 print amount to return 10.00', ->
      service = NikkiApp.productService media: 'print', size: '8x10'
      expect(service.amount()).toEqual '10.00'

    it 'expect wallet print amount to return 10.00', ->
      service = NikkiApp.productService media: 'print', size: 'wallet'
      expect(service.amount()).toEqual '10.00'

    it 'expect canvas amount to return 100.00', ->
      service = NikkiApp.productService media: 'canvas'
      expect(service.amount()).toEqual '100.00'

    it 'expect 18x24 canvas amount to return 100.00', ->
      service = NikkiApp.productService media: 'canvas', size: '18x24'
      expect(service.amount()).toEqual '100.00'

    it 'expect 24x18 canvas amount to return 100.00', ->
      service = NikkiApp.productService media: 'canvas', size: '24x18'
      expect(service.amount()).toEqual '100.00'

    it 'expect wrong size canvas amount to return 100.00', ->
      service = NikkiApp.productService media: 'canvas', size: 'wrong'
      expect(service.amount()).toEqual '100.00'

    it 'expect bookmark amount to return 5.00', ->
      service = NikkiApp.productService media: 'bookmark'
      expect(service.amount()).toEqual '5.00'

    it 'expect wrong size bookmark amount to return 5.00', ->
      service = NikkiApp.productService media: 'bookmark', size: 'wrong'
      expect(service.amount()).toEqual '5.00'

    it 'expect postcard amount to return 5.00', ->
      service = NikkiApp.productService media: 'postcard'
      expect(service.amount()).toEqual '5.00'

    it 'expect wrong size postcard amount to return 5.00', ->
      service = NikkiApp.productService media: 'postcard', size: 'wrong'
      expect(service.amount()).toEqual '5.00'

    return

  describe 'sizes', ->

    it 'expect default sizes to return []', ->
      service = NikkiApp.productService()
      expect(service.sizes()).toEqual []

    it 'expect empty string media sizes to return []', ->
      service = NikkiApp.productService(media: '')
      expect(service.sizes()).toEqual []

    it 'expect undefined media sizes to return []', ->
      service = NikkiApp.productService(media: undefined)
      expect(service.sizes()).toEqual []

    it 'expect funky media sizes to return []', ->
      service = NikkiApp.productService(media: 'funky')
      expect(service.sizes()).toEqual []

    it 'expect print media sizes to return ["4x6", "5x7", "8x10", "wallet"]', ->
      service = NikkiApp.productService(media: 'print')
      expect(service.sizes()).toEqual ["4x6", "5x7", "8x10", "wallet"]

    it 'expect canvas sizes to return ["18x24", "24x18"]', ->
      service = NikkiApp.productService(media: 'canvas')
      expect(service.sizes()).toEqual ["18x24", "24x18"]

    return

  describe 'thicknesses', ->

    it 'expect default thicknesses to return []', ->
      service = NikkiApp.productService()
      expect(service.thicknesses()).toEqual []

    it 'expect funky thicknesses to return []', ->
      service = NikkiApp.productService(media: 'funky')
      expect(service.thicknesses()).toEqual []

    it 'expect empty string thicknesses to return []', ->
      service = NikkiApp.productService(media: '')
      expect(service.thicknesses()).toEqual []

    it 'expect undefined thicknesses to return []', ->
      service = NikkiApp.productService(media: undefined)
      expect(service.thicknesses()).toEqual []

    it 'expect print thicknesses to return []', ->
      service = NikkiApp.productService(media: 'print')
      expect(service.thicknesses()).toEqual []

    it 'expect postcard thicknesses to return []', ->
      service = NikkiApp.productService(media: 'postcard')
      expect(service.thicknesses()).toEqual []

    it 'expect bookmark thicknesses to return []', ->
      service = NikkiApp.productService(media: 'bookmark')
      expect(service.thicknesses()).toEqual []

    it 'expect canvas thicknesses to return ["0.75", "1.5"]', ->
      service = NikkiApp.productService(media: 'canvas')
      expect(service.thicknesses()).toEqual ['0.75', '1.5']

    return

  return
