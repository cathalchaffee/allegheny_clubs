require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  ########################
  # INITIAL CLUB INTSTANCE
  ########################
  def setup
    @club = Club.new(name: "club_name", about: "this is an example club")
  end
  
  ##############
  # INITIAL TEST
  ##############
  test "this should work." do
    assert @club.valid?
  end

  ################
  # PRESENCE TESTS
  ################
  test "name should be present" do
    @club.name = " "
    assert_not @club.valid?
  end

  test "about club should be present" do
    @club.about = " "
    assert_not @club.valid?
  end

  ##################
  # UNIQUENESS TESTS
  ##################
  test "Club names should be unique" do
    duplicate_club = @club.dup
    @club.save
    assert_not duplicate_club.valid?
  end
end
