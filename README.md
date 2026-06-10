# IMS LTI

Ruby library for creating IMS LTI tool providers and consumers.

## Requirements

This version targets Ruby 4.0.3 or newer.

The gem does not depend on Rails at runtime, but it is compatible with Rails
8.1.3. Rails applications can use the plain Ruby service and model APIs exposed
by this gem.

Runtime dependencies are maintained in `ims-lti.gemspec`:

- `addressable ~> 2.9`
- `builder ~> 3.3`
- `faraday ~> 2.14`
- `json-jwt ~> 1.17`
- `rexml ~> 3.4`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ims-lti'
```

And then execute:

```sh
bundle
```

Or install it yourself as:

```sh
gem install ims-lti
```

## Usage

### LTI 1.x

#### Validating Launches

Use the classes in the `IMS::LTI::Models::Messages` module to validate
launches.

For example, in a Rails application:

```ruby
authenticator = IMS::LTI::Services::MessageAuthenticator.new(
  request.url,
  request.request_parameters,
  shared_secret
)

return false unless authenticator.valid_signature?

# check if `params['oauth_nonce']` has already been used

# check if the message is too old
timestamp = DateTime.strptime(request.request_parameters['oauth_timestamp'], '%s')
return false if timestamp < 5.minutes.ago
```

## Development

Use Ruby 4.0.3:

```sh
rvm use 4.0.3
bundle install
```

Run the test suite:

```sh
bundle exec rspec
```

Generate a coverage report:

```sh
COVERAGE=1 bundle exec rspec
```

The HTML coverage report is generated at `coverage/index.html`.

Build the gem:

```sh
bundle exec rake build
```

## Contributing

1. Fork it ( http://github.com/instructure/ims-lti/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
