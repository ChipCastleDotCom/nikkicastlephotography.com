simpleCart
  checkout:
    type: 'PayPal'
    email: Meteor.settings.public.paypalEmail
    sandbox: Meteor.settings.public.paypalSandbox
    success: 'success'
    cancel: 'cancel'
  cartColumns: [
    {
      attr: 'name'
      label: 'Name'
    }
    {
      attr: 'price'
      label: 'Price'
      view: 'currency'
    }
    {
      view: 'decrement'
      label: false
      text: '-'
    }
    {
      attr: 'quantity'
      label: 'Qty'
    }
    {
      view: 'increment'
      label: false
      text: '+'
    }
    {
      attr: 'total'
      label: 'SubTotal'
      view: 'currency'
    }
    {
      view: 'remove'
      text: 'Remove'
      label: false
    }
  ]
