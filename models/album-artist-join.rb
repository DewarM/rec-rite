class AlbumArtistJoin

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @artist_id = params['artist_id']
    @album_id = params['album_id']
  end

  def save()
    sql = "
    INSERT INTO albumartistjoins (
    artist_id,
    album_id
    ) VALUES (
    #{@artist_id},
    #{@album_id}
    ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id']
  end

end
