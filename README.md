# ActiveTodo

[![Build Status](https://travis-ci.org/spajus/activetodo.png?branch=master)](https://travis-ci.org/spajus/activetodo)
[![Coverage Status](https://coveralls.io/repos/spajus/activetodo/badge.png?branch=master)](https://coveralls.io/r/spajus/activetodo)
[![Code Climate](https://codeclimate.com/github/spajus/activetodo.png?branch=master)](https://codeclimate.com/github/spajus/activetodo)

Forget TODO comments that are sitting in your code forever

## Installation

Add this line to your application's Gemfile:

    gem 'activetodo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activetodo

## Usage

Use anywhere in code:
```ruby
# Generic TODO without deadline
TODO 'Add specs'

# After 2014-01-01 it will `Rails.logger.warn` or `puts` if outside Rails
FIXME 'Certificate will expire soon', deadline: '2014-01-01'

# Raises error after 2014-02-28
XXX 'Dirty hack, must refactor', deadline: '2014-02-28', warn_only: false
```

`TODO`, `FIXME` and `XXX` all have same interface: `TODO(<message>, [options_hash])`

You can use `activetodo` with or without Rails.

## Configuring default deadline behavior

By default, ActiveTodo will not raise errors when deadline is reached. You may want to enabled that
depending on your environment. In Rails, do that by creating `config/initializers/activetodo.rb`
with following lines:

```ruby
ActiveTodo.configure do |config|
  # Log deadline warnings in Production, raise errors in Development / Test
  config.warn_only = Rails.env.production?
end
```

You can still override the default configuration by passing `warn_only` option:
```ruby
TODO 'Remove this internal testing controller', deadline: '2013-05-01', warn_only: false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
