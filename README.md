# Roda Plugin for Appsignal Instrumentation

This is a plugin to add [Appsignal](https://appsignal.com) named instrumentation and tracing to [Roda](https://github.com/jeremyevans/roda) applications.

It uses Appsignal's [Rack generic instrumentation](https://docs.appsignal.com/ruby/integrations/rack.html) middleware to trace each request. Once inside a route, you can set [additional instrumentation](https://docs.appsignal.com/ruby/instrumentation/instrumentation.html).

## Installation

Add this line to the application's Gemfile:

```ruby
gem 'roda-appsignal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roda-appsignal

## Usage

Use this plugin in any Roda application that you want to instrument.

```ruby
class App < Roda

  plugin :appsignal

  route do |r|
    r.is 'foo' do
      r.get do
        # will be named/instrumented as 'App::RodaRequest GET /foo'
        'hello world'
      end
      r.post do
        # will be named/instrumented as 'App::RodaRequest POST /foo'
        'hello world'
      end
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/officeluv/roda-appsignal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Roda::Appsignal project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/officeluv/roda-appsignal/blob/master/CODE_OF_CONDUCT.md).
