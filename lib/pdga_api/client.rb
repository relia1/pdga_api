# frozen_string_literal: true

require "faraday"
require "json"
require "oj"
require "dotenv"
require "pdga_api/api/auth"
require "pdga_api/api/request"
require "pdga_api/api/course"
require "pdga_api/api/player"
require "pdga_api/api/event"

module Pdga
  # API Client for PDGA
  class Client
    attr_accessor :username, :password, :sessid, :session_name, :token
    include Pdga::Auth
    include Pdga::Request
    include Pdga::Course
    include Pdga::Player
    include Pdga::Event

    def initialize(options = {})
      raise(ArgumentError, "username and password are required parameters") unless options.key?(:username) && options.key?(:password)

      @username = options[:username]
      @password = options[:password]

      login(username: @username, password: @password)
    end
  end
end
