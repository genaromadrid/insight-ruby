require 'rest-client'
require 'json'

module Insight
  autoload :API,        'insight/api'
  autoload :Connection, 'insight/connection'

  attr_writer :api

  BLOCK_CHAIN = 'btc'

  def self.api
    @api ||= API.new(network:BLOCK_CHAIN)
  end

  def self.method_missing(sym, *args, &block)
    api.send(sym, *args, &block)
  end

end
