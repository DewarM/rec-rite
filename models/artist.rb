require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_reader :id, :name, :picture

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @picture = params['picture']
  end

  def save()
    sql = "INSERT INTO artists (
    name,
    picture
    ) VALUES (
    $1,
    $2
    ) RETURNING *"
    result = SqlRunner.run_prepare(sql, array() )
    @id = result.first['id'].to_i
  end

  def update()
    sql = "
    UPDATE artists SET (
    name,
    picture
    ) = (
    $1,
    $2
    ) WHERE id=#{@id}"
    SqlRunner.run_prepare(sql, array())
  end

  def delete()
    albums().each {|album| album.delete}
    sql="
    DELETE FROM artists
    WHERE id=#{@id}"
    SqlRunner.run(sql)
  end

  def albums()
    sql="
    SELECT albums.* FROM albums
    INNER JOIN albumartistjoins
    ON albums.id = albumartistjoins.album_id
    WHERE albumartistjoins.artist_id = #{@id}
    "
    return SqlRunner.run(sql).map { |album| Album.new(album) }
  end

  def array()
    return [@name, @picture]
  end

  def Artist.find(id)
    sql = "
    SELECT * FROM artists
    WHERE id = #{id}"
    artist = SqlRunner.run(sql).first()
    return Artist.new(artist)
  end

  def Artist.all()
    sql = "
    SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}.sort() {|x,y| x.name <=> y.name }
  end

end
