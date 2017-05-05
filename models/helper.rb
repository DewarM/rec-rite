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

end
