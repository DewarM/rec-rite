require('pg')

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
    db = PG.connect({dbname:'recrite', host:'localhost'})
    result = db.exec(sql)
    @id = result.first['id'].to_i()
    db.close()
  end
end
