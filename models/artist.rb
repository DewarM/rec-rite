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
    '#{@name}',
    '#{@picture}'
    ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def Artist.all()
    sql = "
    SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist)}
  end

end
