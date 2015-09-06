describe 'priceService', ->
  it 'expect bookmark amount to be accurate', ->
    price = NikkiApp.priceService media: 'bookmark'
    expect(price.amount()).toEqual('5.00')
    return

  return
