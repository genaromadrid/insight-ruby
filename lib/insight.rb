require 'rest-client'
require 'json'

module Insight
  autoload :API,        'Insight/api'
  autoload :Connection, 'Insight/connection'

  attr_writer :api

  API_VERSION = 'v1'
  BLOCK_CHAIN = 'btc'

  def self.api
    @api ||= API.new(network:BLOCK_CHAIN, api_version:API_VERSION)
  end

  def self.method_missing(sym, *args, &block)
    api.send(sym, *args, &block)
  end

end
