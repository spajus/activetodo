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

# Raises error after 2014-01-01
FIXME 'Certificate will expire soon', deadline: '2014-01-01'

# After 2014-02-28, does Rails.logger.warn in production, raises error in development / test
XXX 'Dirty hack, must refactor', deadline: '2014-02-28', warn_only: Rails.env.production?
```

`TODO`, `FIXME` and `XXX` all have same interface: `TODO(<message>, [options_hash])`

You can use `activetodo` with or without Rails.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
