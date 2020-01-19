require('minitest/autorun')
require('minitest/reporters')
require ('pry')

require_relative('../guests.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class RoomsTest <Minitest::Test

  def setup
    @hotel = Rooms.new('Hotel', 5, 12)

    @toxic = Songs.new('Toxic', 'pop')
    @intergalactic = Songs.new('Intergalactic', 'hip_hop')
    @birdie_song = Songs.new('Birdie Song', 'shite')

    @choons = [@toxic, @intergalactic, @birdie_song]

    @cust1 = Guests.new("Steve", 50, "Toxic", "blues")
    @cust2 = Guests.new("Mike", 2, "Toxic", "blues")
    @cust3 = Guests.new("Bill", 42, "La Bamba", "blues")




  end

  def test_add_song_to_playlist()
    @hotel.add_song_to_playlist(@toxic)
    @hotel.add_song_to_playlist(@intergalactic)
    @hotel.add_song_to_playlist(@birdie_song)
    assert_equal(@choons, @hotel.playlist)
  end

  def test_add_list_to_playlist
    @hotel.add_playlist_to_playlist(@choons)
    assert_equal(@choons, @hotel.playlist)
  end


  def test_can_guest_fit
    assert_equal(true, @hotel.can_guest_fit)
  end

  def test_can_guest_afford
    assert_equal(true, @hotel.can_guest_afford(@cust1))
  end

  # def test_fav_song_check
  #   @hotel.add_playlist_to_playlist(@choons)
  #
  #   assert_equal(false, @hotel.fav_song_check(@cust3))
  #   assert_equal(true, @hotel.fav_song_check(@cust1))
  # end

  def test_guest_enters_room
    @hotel.add_playlist_to_playlist(@choons)
    @hotel.guest_enters_room(@cust1)
    assert_equal(38, @cust1.money)
    assert_equal(12, @hotel.til)
    assert_equal([@cust1] ,@hotel.guests,[@cust1])
    # assert_equal("we have your favourite song", @hotel.fav_song_check(@cust1))
  end


  def test_guest_leaves_room
    @hotel.guest_enters_room(@cust1)
    @hotel.guest_enters_room(@cust3)
    assert_equal([@cust1], @hotel.guest_leaves_room(@cust3))
    @hotel.guest_enters_room(@cust3)
    assert_equal([@cust3], @hotel.guest_leaves_room(@cust1))

  end


end
