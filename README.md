Bundler::Bower
==============

[![Build Status](https://secure.travis-ci.org/LTe/bundler-bower.png)](http://travis-ci.org/LTe/bundler-bower)
[![Dependency Status](https://gemnasium.com/LTe/bundler-bower.png)](https://gemnasium.com/LTe/bundler-bower)
[![Code Climate](https://codeclimate.com/github/LTe/bundler-bower.png)](https://codeclimate.com/github/LTe/bundler-bower)
[![Coverage Status](https://coveralls.io/repos/LTe/bundler-bower/badge.png?branch=master)](https://coveralls.io/r/LTe/bundler-bower?branch=master)
[![Gem Version](https://badge.fury.io/rb/dht.png)](http://badge.fury.io/rb/dht)

Bower support for bundler. You can use assets from bower directly in `Gemfile`

## Installation

Execute:

    gem install 'bundler-bower'

Add this line to your application's Gemfile:

    require "bundler/bower"

## Usage

Add to your Gemfile require method.

```ruby
# Gemfile
source 'https://rubygems.org'
require 'bundler/bower'

gem 'rake'

asset 'backbone', "0.9"
asset 'moment'
```

You can use DSL from [bower-rails](https://github.com/42dev/bower-rails). Click [here](https://github.com/42dev/bower-rails#ruby-dsl-configuration) for details. Only `group` method is not supported.

```
Using rake (10.1.0)
Using bundler (1.3.5)
bower backbone#*                cached git://github.com/jashkenas/backbone.git#1.1.0
bower backbone#*              validate 1.1.0 against git://github.com/jashkenas/backbone.git#*
bower backbone#*               install backbone#1.1.0

backbone#1.1.0 bower_components/backbone
bower check-new     Checking for new versions of the project dependencies..
dsl-generated dependencies /home/lite/work/bundler-bower/spec/dummy/vendor/assets
└── backbone#1.1.0
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

When you execute `bundle` or `bundle install` bundler-bower will execute `bower install`. But when you execute `bundle update` bundler-bower will execute `bower update`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
