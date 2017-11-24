module Insight
  class API
    attr_reader :network,
                :api_version

    def initialize(network: 'btc', url: nil, api_version: nil)
      @url = url
      self.network = network
      @api_version = api_version
    end

    def url
      @url ||= if network == 'btc'
                 'https://insight.bitpay.com/api'
               else
                 'https://test-insight.bitpay.com/api'
               end
    end

    def url=(other)
      @url = other
      @connection = Connection.new(other)
    end

    def network=(network)
      @network = network
      @connection = Connection.new(url)
    end

    def block(hash)
      @connection.get("/block/#{hash}")
    end

    def blocks(params)
      @connection.get("/blocks#{'?' + params.to_param if params}")
    end

    def latest_block
      blocks(limit: 1)[:blocks].first
    end

    def block_raw(hash)
      @connection.get("/rawblock/#{hash}")
    end

    def transaction(hash)
      @connection.get("/tx/#{hash}")
    end

    def rawtx(hash)
      @connection.get("/rawtx/#{hash}")
    end

    def push_transaction(hex)
      @connection.post('/tx/send', rawtx: hex)
    end

    def address(address)
      @connection.get("/addr/#{address}")
    end

    def address_balance(address)
      @connection.get("/addr/#{address}/balance")
    end

    def address_total_received(address)
      @connection.get("/addr/#{address}/totalReceived")
    end

    def address_total_sent(address)
      @connection.get("/addr/#{address}/totalSent")
    end

    def address_unconfirmed_balance(address)
      @connection.get("/addr/#{address}/unconfirmedBalance")
    end

    def address_unspent_transactions(address, params = nil)
      @connection.get("/addr/#{address}/utxo#{'?' + params.to_param if params}")
    end

    def estimatefee(nbBlocks = 2)
      @connection.get("/utils/estimatefee?nbBlocks=#{nbBlocks}")
    end
  end
end

class Hash
  def to_param
    collect {|k, v| "#{k}=#{v}"} * '&'
  end
end
