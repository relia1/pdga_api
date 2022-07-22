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

Out of the box there are some ENV vars that are needed in order to make this gem work (also assumes you already have PDGA API access)
First in the root directory there are 2 template .env files you can look at for setting up the ENV vars. You can run this with just a secret.env that contains your PDGA username and password
If you run the login method it will write out a .env with additional information the API needs to make calls. (session id, session name, and token)

## Usage

Expected responses can all be found here https://www.pdga.com/dev/api/rest/v1/auth

There are 4 types of actions that this gem allows you to perform.
1. Authentication
   1. login Pdga::Client.login({ username: ENV["USERNAME"], password: ENV["PASSWORD"] }) (Could pass the actual username/password)
   2. connection status Pdga::Client.connect
   3. logout Pdga::Client.logout
2. Player information which takes a hash of various search params that are listed on the PDGA site (default 10 returned with a max of 200)
   1. player search Pdga::Client.players({ pdga_number: "15857" })
   2. player statistics search Pdga::Client.player_statistics({ pdga_number: "15857", year: "2022" })
3. Event information which takes a hash of various search params that are listed on the PDGA site (default 10 returned with a max of 200)
   1. event search Pdga::Client.events({ tournament_id: "47877" })
4. Course information which takes a hash of various search params that are listed on the PDGA site (default 10 returned with a max of 200)
   1. course search Pdga::Client.courses({ course_id: "2146" })

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PdgaApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/relia1/pdga_api/blob/master/CODE_OF_CONDUCT.md).

## Todos

1. Mock the tests!
2. Figure out something better for the ENV vars
3. Add response error handling from the API
4. Refactor duplicated code in client.rb