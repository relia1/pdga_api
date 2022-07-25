# frozen_string_literal: true

require "./test/test_helper"

class PdgaAuthTest < Minitest::Test
  def test_exists
    assert Pdga::Client
  end

  def before_setup
    super
    @client = Pdga.new(username: "username goes here", password: "password goes here")
  end

  def test_it_logs_in_a_user
    # mock this in the future
  end

  def test_it_logs_out_user
    logged_out = @client.logout
    assert_equal [true], @client.logout
  end

  def test_it_checks_logged_in_status
    assert_equal "1", @client.connect["user"]["status"]
  end
end
