# frozen_string_literal: true

require_relative "pdga_api/version"
require_relative "pdga_api/client"
require "dotenv"

module PdgaApi
  class << self
    attr_accessor :options
  end
  self.options = {}

  def self.configure(params = {})
    raise(ArgumentError, "username and password are required parameters") unless params.key?("username") && params.key?("password")

    options[:username] = params[:username]
    options[:password] = params[:password]
  end

  def self.config
    options
  end

  def self.reset_config
    self.options = {}
  end
end
