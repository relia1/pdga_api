# frozen_string_literal: true

require "faraday"
require "json"
require "oj"
require "dotenv"

#TODO move request information to its own file
module Pdga
  # API Client for PDGA
  class Client
    API_ENDPOINT = "https://api.pdga.com"
    attr_accessor :username, :password

    def initialize(options = {})
      raise(ArgumentError, "username and password are required parameters") unless options.key?("username") && options.key?("password")

      @username = options[:username]
      @password = options[:password]
    end

    def self.players(options)
      params = build_params(options)
      response = build_request("get", "services/json/players?#{params}")
      JSON.parse(response.body)
    end

    def self.player_statistics(options)
      params = build_params(options)
      response = build_request("get", "services/json/player-statistics?#{params}")
      JSON.parse(response.body)
    end

    def self.events(options)
      params = build_params(options)
      response = build_request("get", "services/json/event?#{params}")
      JSON.parse(response.body)
    end

    def self.courses(options)
      params = build_params(options)
      response = build_request("get", "services/json/course?#{params}")
      JSON.parse(response.body)
    end

    def self.login(options)
      response = build_request("post", "services/json/user/login", options)
      update_envs(JSON.parse(response.body))
      JSON.parse(response.body)
    end

    def self.connect
      response = build_request("post", "services/json/system/connect")
      JSON.parse(response.body)
    end

    def self.logout
      response = build_request("post", "services/json/user/logout")
      JSON.parse(response.body)
    end

    def self.client
      @client ||= Faraday.new(API_ENDPOINT) do |client|
        client.use Faraday::Response::RaiseError
        client.request :url_encoded
        client.adapter Faraday.default_adapter
        client.headers["Cookie"] = "#{ENV["SESSION_NAME"]}=#{ENV["SESSID"]}"
        client.headers["X-CSRF-Token"] = ENV["TOKEN"]
      end
    end

    def self.request(http_method:, endpoint:, body: {})
      client.public_send(http_method, endpoint, body)
    end

    def self.build_params(options)
      params = ""
      options.each do |key, value|
        params += "#{key}=#{value}&"
      end
      params.chomp!("&")
    end

    def self.build_request(http_method, endpoint, options = {})
      request(
        http_method: http_method.to_sym,
        endpoint: endpoint,
        body: options
      )
    end
  end
end
