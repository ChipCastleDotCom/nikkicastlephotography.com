describe 'priceService', ->

  it 'expect price service amount to return default of 3.00', ->
    service = NikkiApp.priceService()
    expect(service.amount()).toEqual '3.00'
    return

  it 'expect canvas amount to return 100.00', ->
    service = NikkiApp.priceService media: 'canvas'
    expect(service.amount()).toEqual '100.00'
    return

  it 'expect bookmark amount to return 5.00', ->
    service = NikkiApp.priceService media: 'bookmark'
    expect(service.amount()).toEqual '5.00'
    return

  it 'expect postcard amount to return 5.00', ->
    service = NikkiApp.priceService media: 'postcard'
    expect(service.amount()).toEqual '5.00'
    return
  return
