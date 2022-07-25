# frozen_string_literal: true

require "./test/test_helper"

class PdgaPlayerTest < Minitest::Test
  def before_setup
    super
    @client = Pdga.new(username: "username goes here", password: "password goes here")
  end

  def test_exists
    assert Pdga::Client
  end

  def test_it_gives_back_a_single_player
    player = @client.players({ pdga_number: "15857" })

    assert_equal 1, player["players"].count
    player_to_check = player["players"][0]
    assert_equal "Gregg", player_to_check["first_name"]
    assert_equal "Barsby", player_to_check["last_name"]
    assert_equal "15857", player_to_check["pdga_number"]
    assert_equal "current", player_to_check["membership_status"]
    assert_equal "2022-12-31", player_to_check["membership_expiration_date"]
    assert_equal "P", player_to_check["classification"]
    assert_equal "Troup", player_to_check["city"]
    assert_equal "TX", player_to_check["state_prov"]
    assert_equal "US", player_to_check["country"]
    assert_equal "1026", player_to_check["rating"]
    assert_equal "2022-07-12", player_to_check["rating_effective_date"]
    assert_equal "yes", player_to_check["official_status"]
    assert_equal "2023-11-14", player_to_check["official_expiration_date"]
    assert_equal "2021-11-19", player_to_check["last_modified"]
  end

  def test_it_gives_back_a_players_stats
    player = @client.player_statistics({ pdga_number: "15857", year: "2022" })

    assert_equal 1, player["players"].count
    player_to_check = player["players"][0]
    assert_equal "Gregg", player_to_check["first_name"]
    assert_equal "Barsby", player_to_check["last_name"]
    assert_equal "15857", player_to_check["pdga_number"]
    assert_equal "TX", player_to_check["state_prov"]
    assert_equal "United States", player_to_check["country"]
    assert_equal "1026", player_to_check["rating"]
    assert_equal "2022", player_to_check["year"]
    assert_equal "P", player_to_check["class"]
    assert_equal "Male", player_to_check["gender"]
    assert_equal "Open", player_to_check["division_name"]
    assert_equal "MPO", player_to_check["division_code"]
    assert_equal "1026", player_to_check["rating"]
    assert_equal "14", player_to_check["tournaments"]
    assert_equal "64", player_to_check["rating_rounds_used"]
    assert_equal "8885", player_to_check["points"]
    assert_equal "16369", player_to_check["prize"]
    assert_equal "2022-07-20", player_to_check["last_modified"]
  end
end
