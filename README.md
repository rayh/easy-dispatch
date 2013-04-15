# EasyDispatch

Super simple concurrecy in ruby

## Installation

Add this line to your application's Gemfile:

    gem 'easy_dispatch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_dispatch

## Usage

### Apply function to array, concurrently

Synonymous to GCD's dispatch_apply:

```ruby
[0,1,10,20].apply(2) do |i|
  puts i
end
```

this will invoke the block for each object in the array, but with a concurrency of 2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
