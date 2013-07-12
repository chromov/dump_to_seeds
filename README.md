# DumpToSeeds

## Installation

Add `dump_to_seeds` to your project's Gemfile and do `bundle install`

**NOTE:** Only tested with Rails 2.x


## Usage

```ruby
Author.first.to_seed([:articles => [:comments]])

```

## Licence

This gem is available under the MIT Licence.
