class Ticket

attr_reader :id
attr_accessor :customer_id, :film_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @customer_id = options['movie_id'].to_i
  @film_id = options['star_id'].to_i
end


end
