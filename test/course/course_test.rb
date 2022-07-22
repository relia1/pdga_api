# frozen_string_literal: true

require "./test/test_helper"

class PdgaPlayerTest < Minitest::Test
  def test_exists
    assert Pdga::Client
  end

  def test_it_gives_back_a_single_course
    course = Pdga::Client.courses({ course_id: "2146" })

    assert_equal 1, course["courses"].count
    course_to_check = course["courses"][0]
    assert_equal "2146", course_to_check["course_id"]
    assert_equal "25393", course_to_check["course_node_nid"]
    assert_equal "Bluemont Park", course_to_check["course_name"]
    assert_equal "Permanent", course_to_check["course_type"]
    assert_equal "Tight fairways, hills, trees, and a creek all come into play. 3 cement tees and 4 pin placements on every hole. Plays like 27.", course_to_check["course_description"]
    assert_equal "", course_to_check["distance"]
    assert_equal "38.868250000000", course_to_check["latitude"]
    assert_equal "-77.130619000000", course_to_check["longitude"]
    assert_equal "tee", course_to_check["location_type"]
    assert_equal "Arlington", course_to_check["city"]
    assert_equal "329 N. Manchester St.", course_to_check["street"]
    assert_equal "", course_to_check["street2"]
    assert_equal "VA", course_to_check["state_province"]
    assert_equal "22201", course_to_check["postal_code"]
    assert_equal "Virginia", course_to_check["state_province_name"]
    assert_equal "United States", course_to_check["country"]
    assert_equal "9", course_to_check["holes"]
    assert_equal "I-495 (Capital Beltway west of DC) to Rte. 50 E (Arlington Blvd.), 4.5 miles, left on N. Manchester St., right into park. Park at far right end of parking lot. 1st tee past restrooms, kiddy playland and basketball court", course_to_check["directions"]
    assert_equal "Mach3", course_to_check["basket_types"]
    assert_equal "Concrete", course_to_check["tee_types"]
    assert_equal "1960", course_to_check["total_length_of_course"]
    assert_equal "3000", course_to_check["total_length_of_alternate"]
    assert_equal "8", course_to_check["number_of_holes_less_than_300"]
    assert_equal "1", course_to_check["number_of_holes_between_300_and_400"]
    assert_equal "0", course_to_check["number_of_holes_greater_than_400"]
    assert_equal "no", course_to_check["camping"]
    assert_equal "yes", course_to_check["facilities"]
    assert_equal "no", course_to_check["fees"]
    assert_equal "no", course_to_check["handicap"]
    assert_equal "no", course_to_check["private"]
    assert_equal "yes", course_to_check["signage"]
    assert_equal "Tim Beron", course_to_check["contact_name"]
    assert_equal "3956", course_to_check["contact_pdga_number"]
    assert_equal "703-256-5191", course_to_check["contact_home_phone"]
    assert_equal "5", course_to_check["course_foliage"]
    assert_equal "5", course_to_check["course_elevation"]
    assert_nil course_to_check["legacy_course_id"]
    assert_equal "1980", course_to_check["year_established"]
    assert_equal "http://www.novadiscgolf.org", course_to_check["external_link_1_url"]
    assert_equal "NOVA Disc Golf Association", course_to_check["external_link_1_title"]
    assert_equal "9/2/2009", course_to_check["created"]
    assert_equal "10/18/2016", course_to_check["update"]
  end
end
