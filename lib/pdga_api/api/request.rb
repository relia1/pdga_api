# frozen_string_literal: true

module Pdga
  module Request
    API_ENDPOINT = "https://api.pdga.com"
    attr_accessor :sessid, :session_name, :token

    protected

    def client
      Faraday.new(API_ENDPOINT) do |client|
        client.use Faraday::Response::RaiseError
        client.request :url_encoded
        client.adapter Faraday.default_adapter
        client.headers["Cookie"] = "#{@session_name}=#{@sessid}"
        client.headers["X-CSRF-Token"] = @token
      end
    end

    def request(http_method:, endpoint:, body: {})
      client.public_send(http_method, endpoint, body)
    end

    def build_params(options)
      params = ""
      options.each do |key, value|
        params += "#{key}=#{value}&"
      end
      params.chomp!("&")
    end

    def build_request(http_method, endpoint, options = {})
      JSON.parse(request(
        http_method: http_method.to_sym,
        endpoint: endpoint,
        body: options
      ).body)
    end

    def save_session_information(login_response)
      @sessid = login_response["sessid"]
      @session_name = login_response["session_name"]
      @token = login_response["token"]
    end
  end
end
