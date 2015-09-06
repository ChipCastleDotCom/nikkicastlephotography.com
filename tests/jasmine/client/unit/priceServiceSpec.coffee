describe 'priceService', ->
  it 'expect price service to return default amount', ->
    service = NikkiApp.priceService()
    expect(service.amount()).toEqual('10.00')
    return

  it 'expect bookmark amount to be accurate', ->
    service = NikkiApp.priceService media: 'bookmark'
    expect(service.amount()).toEqual('5.00')
    return

  return
