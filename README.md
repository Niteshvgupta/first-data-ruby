# Firstdata

Lightweight ruby bindings for the Firstdata 'Global Gateway e4' API.

Note: This works for v12+ of the API.
It calculates the HMAC hash according to this
(https://support.payeezy.com/hc/en-us/articles/203731149-API-Security-HMAC-Hash)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'firstdata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install firstdata

## Usage

Note: It is recommended that you use environment variables to set these values.

To set the keys:

```ruby
 Firstdata.gateway_id = # gateway id goes here
 Firstdata.password = # password goes here
 Firstdata.key_id = # key id goes here
 Firstdata.key = # key goes here
```

To make a transaction:

```ruby
 Firstdata.transact(
    # request hash goes here.
 )
```

For more information on what to put in the request hash, refer to the
API reference guide - https://firstdata.zendesk.com/entries/407571-First-Data-Global-Gateway-e4-Web-Service-API-Reference-Guide

or scroll down for examples.

## Examples

Purchase:

```ruby
Firstdata.transact(
  {
    transaction_type: '00',
    amount: 0,
    cc_expiry: '1020',
    cardholder_name: 'Test Name',
    cc_number: '4111111111111111',
    cvd_code: '1111',
    currency_code: 'USD',
    address: {
      address1: 'Address Line 1',
      city: 'City',
      state: 'MA',
      zip: '02108',
      phone_number: '1111111111',
      phone_type: 'H',
    }
  }
)
```

Pre-Authorization:

```ruby
Firstdata.transact(
  {
    transaction_type: '01',
    amount: 0,
    cc_expiry: '1020',
    cardholder_name: 'Test Name',
    cc_number: '4111111111111111',
    cvd_code: '1111',
    currency_code: 'USD',
    address: {
      address1: 'Address Line 1',
      city: 'City',
      state: 'MA',
      zip: '02108',
      phone_number: '1111111111',
      phone_type: 'H',
    }
  }
)
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/firstdata/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
