# frozen_string_literal: true

module Pdga
  module Player
    def players(options)
      build_request("get", "services/json/players?#{build_params(options)}")
    end

    def player_statistics(options)
      build_request("get", "services/json/player-statistics?#{build_params(options)}")
    end
  end
end
