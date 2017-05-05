require_relative('../db/sql_runner.rb')

class Stockrule

  attr_reader :stock_high, :stock_medium, :stock_low

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @stock_high = params['stock_high'].to_i
    @stock_medium = params['stock_medium'].to_i
    @stock_low = params['stock_low'].to_i
  end

  def save()
    sql = "
    INSERT INTO stockrules (
    stock_high,
    stock_medium,
    stock_low
    ) VALUES (
    #{@stock_high},
    #{@stock_medium},
    #{@stock_low}
    ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

end