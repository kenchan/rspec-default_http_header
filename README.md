# RSpec::DefaultHttpHeader

Set default http headers in request specs.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-default_http_header'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-default_http_header

## Setup

Include RSpec::DefaultHeader into your RSpec.configuration.

```ruby
RSpec.configure do |config|
  config.include RSpec::DefaultHttpHeader, type: :request
end
```

## Usage

### let(:default_headers)

```ruby
RSpec.describe 'GET /api/users.json' do
  context 'with authorization headers' do
    let(:default_headers) { {Authorization: 'your-authorization-token'} }

    before do
      get '/api/users.json'
    end

    it { expect(response).to be_success }
  end
end
```

### modify default_headers hash

```ruby
RSpec.describe 'GET /api/users.json' do
  context 'with authorization headers' do
    before do
      default_headers[:Authorization] = 'your-authorization-token'

      get '/api/users.json'
    end

    it { expect(response).to be_success }
  end
end
```

### set in a batch to tests using the tag

```ruby
RSpec.configure do |config|
  config.before(:example, type: :request, authorized: true) do
    default_headers[:Authorization] = 'your-authorization-token'
  end
end

RSpec.describe 'GET /api/users.json' do
  context 'with authorization headers', :authorized do
    before do
      get '/api/users.json'
    end

    it { expect(response).to be_success }
  end
end
```

## Contributing

1. Fork it ( https://github.com/kenchan/rspec-default_http_header/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
