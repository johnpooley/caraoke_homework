require('minitest/autorun')
require('minitest/reporters')

require_relative('../guests.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class GuestsTest <Minitest::Test

  def setup
    @cust1 = Guests.new("Steve", 50, "Toxic", "blues")

  end

  def test_customer
    assert_equal(@cust1.name, "Steve" )
    assert_equal(@cust1.money, 50 )
    assert_equal(@cust1.fav_song, "Toxic" )
    assert_equal(@cust1.fav_style, "blues" )
  end

end
