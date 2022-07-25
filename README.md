# PdgaApi
PDGA API Wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdga_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pdga_api
## Starting steps

In order to use this you will need to initialize using your pdga username and password

## Usage

Expected responses can all be found here https://www.pdga.com/dev/api/rest/v1/auth

There are 4 types of actions that this gem allows you to perform.
1. Authentication
   1. Initialize `@client = Pdga.new(username: "username goes here", password: "password goes here")`
   2. connection status `@client.connect`
   3. logout `@client.logout`
2. Player information which takes a hash of various search params that are listed on the PDGA site (default 10 returned with a max of 200)
   1. player search `@client.players({ pdga_number: "15857" })`
   2. player statistics search `@client.player_statistics({ pdga_number: "15857", year: "2022" })`
3. Event information which takes a hash of various search params that are listed on the PDGA site (default 10 returned with a max of 200)
   1. event search `@client.events({ tournament_id: "47877" })`
4. Course information which takes a hash of various search params that are listed on the PDGA site (default 10 returned with a max of 200)
   1. course search `@client.courses({ course_id: "2146" })`

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PdgaApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/relia1/pdga_api/blob/master/CODE_OF_CONDUCT.md).

## Todos

1. Mock the tests!
2. Make readme pretty and thorough 
3. Make sure config will load from rails config/initializers