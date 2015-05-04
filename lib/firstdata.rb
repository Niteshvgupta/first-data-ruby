# Description: This gem wraps API calls to the First Data Global Gateway E4.
#
# After running speed tests, I chose net/http over curb, rest-client, and open-uri.
#
# Copyright (c) 2015 Nitesh Gupta
#
# MIT License

require 'json'
require 'openssl'
require 'net/http'
require 'time'
require 'base64'

require_relative 'firstdata/version'

module Firstdata
  @api_url = 'https://api.globalgatewaye4.firstdata.com/transaction/v14'

  class << self
    attr_accessor :gateway_id, :password, :key_id, :key, :api_url
  end

  def self.transact(payload)
    body = payload.merge(gateway_id: @gateway_id, password: @password).to_json
    post(set_headers(body), body, api_url)
  end

  private

  def self.digest(payload)
    OpenSSL::Digest.new('sha1', payload)
  end

  def self.gen_hmac(digest, data)
    Base64.strict_encode64(OpenSSL::HMAC.digest(digest, @key, data))
  end

  def self.concat(*args)
    args.join("\n")
  end

  def self.urn
    @api_url.split('.com').last
  end

  def self.set_headers(payload)
    type = 'application/json'
    time = Time.now.utc.iso8601
    content_digest = digest(payload)
    data = concat('POST', type, content_digest.to_s, time, urn)
    hmac = gen_hmac(content_digest, data)
    {
        'Content-Type' => type,
        'Accept' => type,
        'x-gge4-date' => time,
        'x-gge4-content-sha1' => content_digest.to_s,
        'Authorization' => "GGE4_API #{@key_id}:#{hmac}"
    }
  end

  def self.post(headers, body, url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = body
    commit_post(http, request)
  end

  def self.commit_post(http, request)
    begin
      response = http.request(request)
      JSON.parse response.body
    rescue JSON::ParserError
      handle_error(response)
    end
  end

  def self.handle_error(e)
    e = e.body if e.body
    { 'Error' => { 'messages' => "#{e.inspect}" } }
  end
end