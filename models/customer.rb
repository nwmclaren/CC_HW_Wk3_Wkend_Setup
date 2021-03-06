require_relative("../db/sql_runner")

class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
  	  @id = options['id'].to_i if options['id']
  	  @name = options['name']
  	  @funds = options['funds'].to_i()
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end


  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * from customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
      sql = "SELECT films.* FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      WHERE customer_id = $1
      ORDER BY films.title"
      values = [@id]
      movies = SqlRunner.run(sql, values)
      result = movies.map { |movie|
      Film.new(movie) }
      return result
  end

  def customer_tickets()
    sql = "SELECT COUNT (customer_id) FROM tickets
    INNER JOIN customers
    ON tickets.customer_id = customers.id
    WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    result = tickets
    # result = movies.map { |ticket|
    # Ticket.new(ticket) }
    # return result
  end

  def reduce_funds(price)
    @funds -= price
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_data = SqlRunner.run(sql)
    return Star.map_items(customer_data)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
