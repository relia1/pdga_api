# frozen_string_literal: true

module Pdga
  module Auth
    def login(options)
      response = build_request("post", "services/json/user/login", options)
      save_session_information(response)
      response
    end

    def connect
      build_request("post", "services/json/system/connect")
    end

    def logout
      build_request("post", "services/json/user/logout")
    end
  end
end
