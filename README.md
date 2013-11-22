bundler-bower
==============

[![Build Status](https://secure.travis-ci.org/LTe/bundler-bower.png)](http://travis-ci.org/LTe/bundler-bower)
[![Dependency Status](https://gemnasium.com/LTe/bundler-bower.png)](https://gemnasium.com/LTe/bundler-bower)
[![Code Climate](https://codeclimate.com/github/LTe/bundler-bower.png)](https://codeclimate.com/github/LTe/bundler-bower)
[![Coverage Status](https://coveralls.io/repos/LTe/bundler-bower/badge.png?branch=master)](https://coveralls.io/r/LTe/bundler-bower?branch=master)
[![Gem Version](https://badge.fury.io/rb/dht.png)](http://badge.fury.io/rb/dht)

Bower support for bundler. You can use assets from bower directly in `Gemfile`

### Requirements

* [node](http://nodejs.org)
* [bower](https://github.com/bower/bower) (>= 0.10.0) installed with npm
* ruby >= 1.9

## Installation

Execute:

```ruby
gem install 'bundler-bower'
```

Add this line to your application's Gemfile:

```ruby
require "bundler/bower"
```

## Usage

Add to your Gemfile require method.

```ruby
# Gemfile
source 'https://rubygems.org'
require 'bundler/bower'

# ...
```

You can use DSL from [bower-rails](https://github.com/42dev/bower-rails). Click [here](https://github.com/42dev/bower-rails#ruby-dsl-configuration) for details.

### Usage with Gemfile

You can use `asset` method directly in your Gemfile.

```ruby
# Gemfile
source 'https://rubygems.org'
require 'bundler/bower'

gem 'rails'
asset 'backbone', '0.9'
```

### Usage with Bowerfile

You can use `Bowerfile` from [bower-rails](https://github.com/42dev/bower-rails). This file should be in the same directory as the `Gemfile`.

```ruby
# Gemfile
source 'https://rubygems.org'
require 'bundler/bower'

gem 'rails'
```

And `Bowerfile`

```ruby
# Bowerfile

asset 'backbone', '0.9'
```

### Usage with bower.json

You can use `bower.json` from [bower-rails](https://github.com/42dev/bower-rails). This file should be in the same directory as the `Gemfile`.

```ruby
# Gemfile
source 'https://rubygems.org'
require 'bundler/bower'

gem 'rails'
```

And `bower.json`

```ruby
# bower.json
{
  "vendor": {
    "name": "bower-rails generated vendor assets",
    "dependencies": {
      "backbone"    : "0.9"
    }
  }
}
```

## Install dependencies

Just execute `bundle install`.

```
Using rake (10.1.0)
Using bundler (1.3.5)
bower backbone#0.9              cached git://github.com/jashkenas/backbone.git#0.9.10
bower backbone#0.9            validate 0.9.10 against git://github.com/jashkenas/backbone.git#0.9
bower backbone#0.9             install backbone#0.9.10

backbone#0.9.10 bower_components/backbone
bower check-new     Checking for new versions of the project dependencies..
dsl-generated dependencies /home/lite/work/bundler-bower/spec/dummy/vendor/assets
├── backbone#0.9.10 (latest is 1.1.0)
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

When you execute `bundle` or `bundle install` bundler-bower will execute `bower install`. But when you execute `bundle update` bundler-bower will execute `bower update`. When bundler quits you can find your assets in `vendor/assets/bower_components`. Of course you can change this directory by `assets_path` method.

## Configure asset pipeline

```ruby
# config/application.rb

# include Bower components in compiled assets
config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
```

Update your `application.js` file

```
// app/assets/javascripts/application.js
//
// Bower packages
//= require backbone/backbone
//
// Other components
//= require jquery
//= require jquery_ujs
// ...
```

ENJOY!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/LTe/bundler-bower/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

