require('minitest/autorun')
require('minitest/reporters')

require_relative('../guests.rb')
require_relative('../songs.rb')
require_relative('../rooms.rb')

Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class SongsTest <Minitest::Test

  def setup
    @toxic = Songs.new('Toxic', 'pop')
    @intergalactic = Songs.new('Intergalactic', 'hip_hop')
    @birdie_song = Songs.new('Birdie Song', 'shite')
  end
end
