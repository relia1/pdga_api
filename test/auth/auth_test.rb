# frozen_string_literal: true

require "./test/test_helper"

class PdgaAuthTest < Minitest::Test
  def test_exists
    assert Pdga::Client
  end

  def test_it_logs_in_a_user
    logged_in_user = Pdga::Client.login({ username: ENV["USERNAME"], password: ENV["PASSWORD"] })
    assert_equal true, logged_in_user.key?("sessid")
    assert_equal true, logged_in_user.key?("session_name")
    assert_equal true, logged_in_user.key?("token")

    user_details = logged_in_user["user"]
    assert_equal "Robert Elia 185536", user_details["name"]
    assert_equal true, user_details["roles"].key?("2")
    assert_equal true, user_details["roles"].key?("5")
    assert_equal true, user_details["roles"].key?("8")
  end

  def test_it_logs_out_user
    logged_out = Pdga::Client.logout
    assert_equal [true], logged_out
  end

  def test_it_checks_logged_in_status
    assert_equal "1", Pdga::Client.connect["user"]["status"]
  end
end
