require('pry')

class Rooms

  attr_reader :name, :capacity, :playlist, :til, :guests
  attr_writer :guests, :playlist, :til

  def initialize(name, capacity, price)
    @name = name
    @capacity = capacity
    @price = price
    @guests = []
    @playlist = []
    @til = 0
  end

  # playlist
  def add_song_to_playlist(song)
    # title = song[@song_title]
    @playlist << song
  end

  def add_playlist_to_playlist(list)
    for song in list
      @playlist << song
    end
  end


  # guest checks
  def can_guest_fit()
    # capacity = :room[capacity]
    return false unless @capacity > @guests.count
    return true

  end

  def can_guest_afford(guest)
    return true unless guest.money < @price
  end

  # def fav_song_check(guest)
  #   name = guest
  #   # binding pry
  #   for song in @playlist
  #     if :song_title == :name.fav_song
  #       return true
  #     else return false
  #     end
  #   end
  # end

  def guest_enters_room(guest)
    return "room is full" unless  can_guest_fit == true
    return "room is too expensive" unless can_guest_afford(guest) == true
    @til += @price
    guest.money -= @price
    @guests << guest
    # fav_song_check(guest)
  end

  def guest_leaves_room(guest)
    for person in @guests
      if person == guest
        @guests.delete(person)
      end
    end
  end



end
