# frozen_string_literal: true

module Pdga
  module Course
    def courses(options)
      build_request("get", "services/json/course?#{build_params(options)}")
    end
  end
end
