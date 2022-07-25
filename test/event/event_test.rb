# frozen_string_literal: true

require "./test/test_helper"

class PdgaEventTest < Minitest::Test
  def before_setup
    super
    @client = Pdga.new(username: "username goes here", password: "password goes here")
  end

  def test_exists
    assert Pdga::Client
  end

  def test_it_gives_back_a_single_event
    event = @client.events({ tournament_id: "47877" })

    assert_equal 1, event["events"].count
    event_to_check = event["events"][0]
    assert_equal "47877", event_to_check["tournament_id"]
    assert_equal "DGPT - Las Vegas Challenge presented by Innova", event_to_check["tournament_name"]
    assert_equal "Henderson", event_to_check["city"]
    assert_equal "NV", event_to_check["state_prov"]
    assert_equal "United States", event_to_check["country"]
    assert_equal "36.0376448", event_to_check["latitude"]
    assert_equal "-115.0762536", event_to_check["longitude"]
    assert_equal "2021-02-25", event_to_check["start_date"]
    assert_equal "2021-02-28", event_to_check["end_date"]
    assert_equal "Pro", event_to_check["class"]
    assert_equal "NT", event_to_check["tier"]
    assert_equal "sanctioned", event_to_check["status"]
    assert_equal "singles", event_to_check["format"]
    assert_equal "Jeff Jacquart", event_to_check["tournament_director"]
    assert_equal "10749", event_to_check["tournament_director_pdga_number"]
    assert_equal "Chris Arnold", event_to_check["asst_tournament_director"]
    assert_equal "79313", event_to_check["asst_tournament_director_pdga_number"]
    assert_equal "JacquartEventsLLC@gmail.com", event_to_check["event_email"]
    assert_equal "702-249-0387", event_to_check["event_phone"]
    assert_equal "https://www.pdga.com/tour/event/47877", event_to_check["event_url"]
    assert_equal "http://www.lvcdg.com", event_to_check["website_url"]
    assert_equal "https://www.discgolfscene.com/tournaments/2021_Las_Vegas_Challenge_presented_by_Innova_DGPT_Elite_Series/register", event_to_check["registration_url"]
    assert_equal "2021-02-26", event_to_check["last_modified"]
  end
end
