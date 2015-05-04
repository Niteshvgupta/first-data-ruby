require '../lib/firstdata.rb'
require 'minitest/autorun'

describe Firstdata do
  it 'can set keys properly' do
	  Firstdata.gateway_id = 'gatewayid'
    Firstdata.password = 'password'
    Firstdata.key_id = 'key_id'
    Firstdata.key = 'key'
	  Firstdata.gateway_id.must_equal 'gatewayid'
    Firstdata.password.must_equal 'password'
    Firstdata.key_id.must_equal 'key_id'
    Firstdata.key.must_equal 'key'
  end

  #
  # I've commented out the test below, as you will need to sign up for a test
  # account in order to test transactions.
  #
  # You can sign up for a test account by clicking the link below:
  # https://provisioning.demo.globalgatewaye4.firstdata.com/signup
  #
  # it 'can make a transaction' do
  #   Firstdata.gateway_id = 'gateway id goes here'
  #   Firstdata.password = 'password goes here'
  #   Firstdata.key_id = 'key id goes here'
  #   Firstdata.key = 'hmac key goes here'
  #   Firstdata.api_url = 'https://api.demo.globalgatewaye4.firstdata.com/transaction/v14'
  #   req_body = {
  #     transaction_type: '00',
  #     amount: 10,
  #     cc_expiry: '1020',
  #     cardholder_name: 'Random Name',
  #     cc_number: '4111111111111111',
  #     cvd_code: '1111',
  #     currency_code: 'USD',
  #     address: {
  #       address1: 'Address Line 1',
  #       city: 'City',
  #       state: 'MA',
  #       zip: '02108',
  #       phone_number: '1111111111',
  #       phone_type: 'H',
  #     }
  #   }
  #   Firstdata.transact(req_body)['transaction_error'].must_equal 0
  # end
end