require_relative('./album-artist-join')

class Helper

  def Helper.save_album_artist(params)
    album = Album.new(params)
    album.save()
    AlbumArtistJoin.new({
      'artist_id' => "#{params['artist_id']}",
      'album_id' => "#{album.id}"
      }).save()
  end

  def Helper.build_type(session)
    return 302 unless session[:stock_level] || session[:artist_id]
    return 307
  end

  def Helper.build_redirect(session)
    return "/albums" unless session[:stock_level] || session[:artist_id]

    base = "/filter?"
    if session[:stock_level]
      stock_level = "stock_level=#{session[:stock_level]}"
    else
      stock_level = ""
    end

    if session[:artist_id]
      artist_id = "artist_id=#{session[:artist_id]}"
    else
      artist_id = ""
    end

    return base + stock_level + "&" + artist_id
  end

end
