# Insight

Ruby SDK for insight.bitpay.com

[![Gem Version][gem-version-image]][gem-version-url]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insight_bitpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install insight_bitpay

## Usage

### Initialize the library
  
  ```ruby
    insight_api = Insight::API.new(network: 'btc')
    # For testnet3
    insight_api = Insight::API.new(network: 'tbtc')
  ```

You can also change the Blockchain using:
  ```ruby
    insight_api.network = 'tbtc'
  ```

### Posible Methods

You can use any of these methods with the initialized object or simply by calling:

  ```ruby
    Insight.block(hash)
    Insight.block_raw(hash)
    Insight.transaction(hash)
    Insight.push_transaction(hex)
    Insight.address(address)
    Insight.address_balance(address)
    Insight.address_total_received(address)
    Insight.address_total_sent(address)
    Insight.address_unconfirmed_balance(address)
    Insight.address_unspent_transactions(address, params = nil)
    Insight.estimatefee(nbBlocks = 2)
  ```

## Contributing

To bump the version you can use the `./bump` python script, just write it in the terminal to see the options.

1. Fork it ( https://github.com/genaromadrid/insight-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
 
[gem-version-image]: https://badge.fury.io/rb/Insight-ruby.svg
[gem-version-url]: https://badge.fury.io/rb/Insight-ruby
