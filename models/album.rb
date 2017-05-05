require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :stock, :cover_url

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @stock = params['stock'].to_i
    @cover_url = params['cover_url']
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
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end
end
