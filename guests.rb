class Guests

  attr_reader :name, :money, :fav_song, :fav_style
  attr_writer :money

  def initialize (name, money, fav_song, fav_style)

    @name = name
    @money = money
    @fav_song = fav_song
    @fav_style = fav_style

  end



end
