require_relative('stockrule')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album
  attr_accessor :stock
  attr_reader :id, :title, :cover_url, :stock_rule_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @stock = params['stock'].to_i
    @cover_url = params['cover_url']
    @stock_rule_id = params['stock_rule_id'].to_i if params['stock_rule_id']
  end

  def array()
    return [@title, @stock, @cover_url]
  end

  def save()
    sql = "
    INSERT INTO albums (
    title,
    stock,
    cover_url
    ) VALUES (
    $1,
    $2,
    $3
    ) RETURNING * "
    result = SqlRunner.run_prepare(sql, array())
    @id = result.first['id'].to_i()
    @stock_rule_id = result.first['stock_rule_id'].to_i
  end

  def update()
    sql = "
    UPDATE albums SET (
    title,
    stock,
    cover_url
    ) = (
    $1,
    $2,
    $3
    ) WHERE id=#{@id}"
    SqlRunner.run_prepare(sql, array() )
  end

  def Album.find(id)
    puts id
    sql = "
    SELECT * FROM albums
    WHERE id=#{id};"
    result = SqlRunner.run(sql)
    return Album.new(result.first())
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

  def stock_status()
    sql = "
    SELECT * FROM stockrules
    WHERE id=#{@stock_rule_id}"
    result = SqlRunner.run(sql)
    stock_rule = Stockrule.new(result.first)
    return "low" if @stock  >= stock_rule.stock_low
    return "medium" if @stock >= stock_rule.stock_medium
    return "high" 
  end

  def add_stock()
    @stock += 1
    return self
  end

  def remove_stock()
    @stock -= 1
    @stock = 0 if @stock < 0
    return self
  end

  def Album.filter_stock_level(stock_level)
    return Album.all() if stock_level == "any"
    return Album.all().select { |album| album.stock_status == stock_level }

  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end
end
