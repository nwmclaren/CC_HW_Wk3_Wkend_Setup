require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry')

customer1 = Customer.new ({
  'name' => 'John',
  'funds' => 50
})

customer2 = Customer.new ({
  'name' => 'Adam',
  'funds' => 70
})

customer3 = Customer.new ({
  'name' => 'Kilian',
  'funds' => 100
})

# customer1.save()
# customer2.save()
# customer3.save()

film1 = Film.new ({
  'title' => 'Shawshank Redemption',
  'price' => 10
  })

film2 = Film.new ({
  'title' => 'Midnight Run',
  'price' => 10
      })

film3 = Film.new ({
    'title' => 'Se7en',
    'price' => 10
      })

# film1.save()
# film2.save()
# film3.save()

binding.pry
nil
