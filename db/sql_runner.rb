require('pg')

class SqlRunner

  def SqlRunner.run(sql)
    begin
      db = PG.connect({dbname:'recrite', host:'localhost'})
      result = db.exec(sql)
    ensure
      db.close()
    end
    return result
  end

  def SqlRunner.run_prepare(sql, fields)
    begin
      db = PG.connect({dbname:'recrite', host:'localhost'})
      db.prepare('ins', sql)
      result = db.exec_prepared('ins', fields)
    ensure
      db.close()
    end
    return result
  end
end
