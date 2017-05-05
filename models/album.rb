require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :stock, :cover_url, :stock_rule_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @stock = params['stock'].to_i
    @cover_url = params['cover_url']
    @stock_rule_id = params['stock_rule_id'].to_i if params['stock_rule_id']
  end

  def save()
    sql = "
    INSERT INTO albums (
    title,
    stock,
    cover_url
    ) VALUES (
    '#{@title}',
    #{@stock},
    '#{@cover_url}'
    ) RETURNING * "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i()
    @stock_rule_id = result.first['stock_rule_id'].to_i
  end

  def artist()
    sql = "
    SELECT artists.* FROM artists
    INNER JOIN albumartistjoins
    ON artists.id = albumartistjoins.artist_id
    WHERE albumartistjoins.album_id = #{@id}
    "
    result = SqlRunner.run(sql)
    return Artist.new(result.first())
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end
end
