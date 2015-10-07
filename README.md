# LoadableAttributes

Remove boilerplate code to ensure `load` is called before accessing an attribute.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'loadable_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install loadable_attributes

## Usage

```ruby
require 'loadable_attributes'

class JSONFoo
  def initialize(json)
    @json = json
  end

  extend LoadableAttributes
  attr_loadable :foo

  def load
    @data = JSON.parse(@json)
    @foo = @data['foo']
  end
end

json_foo = JSONFoo.new('{"foo": 42}')
json_foo.loaded? # => false
json_foo.foo
json_foo.loaded? # => true
```

If you want to ensure `load` has been called without accessing an attribute, you can call `load!`.
It will call `load` only once.

```ruby
json_foo = JSONFoo.new(File.read('huge.json'))
json_foo.load!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/etiennebarrie/loadable_attributes.

