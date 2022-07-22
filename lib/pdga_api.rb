# frozen_string_literal: true

require_relative "pdga_api/version"
require_relative "pdga_api/client"
require "dotenv"

module PdgaApi
  class Error < StandardError; end
  # Your code goes here...
  Dotenv.load("pdga_api.env", "secret.env")
end
