require_relative('../db/sql_runner.rb')

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
    return artists.map { |artist| Artist.new(artist)}.sort() {|x,y| x.title <=> y.title }
  end

end
