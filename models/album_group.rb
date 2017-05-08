class AlbumGroup

  attr_reader :album_array

  def initialize(album_array)
    @album_array = album_array
  end

  def filter_stock_level(stock_level)
    return AlbumGroup.new(@album_array) if stock_level == "any"
    return AlbumGroup.new(@album_array.select { |album| album.stock_status == stock_level })
  end

  def filter_artist(artist_id)
    return AlbumGroup.new(@album_array) if artist_id == "any"
    return AlbumGroup.new(@album_array.select { |album| album.artist.id == artist_id.to_i })
  end

  def filter(stock_level, artist_id)
    result = filter_stock_level(stock_level).filter_artist(artist_id)
    return result.album_array
  end

end
