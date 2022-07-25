# frozen_string_literal: true

module Pdga
  module Event
    def events(options)
      build_request("get", "services/json/event?#{build_params(options)}")
    end
  end
end
