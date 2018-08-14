puts 'clear db'
Booking.destroy_all
Wall.destroy_all
User.destroy_all

puts 'make 2 users'
User.new(email: 'abc@example.com', password: '123456').save
User.new(email: 'def@example.com', password: '123456').save

puts 'make a wall that belongs to abc'
w = Wall.new(name: 'abc wall', address: 'berlin', description: 'a wonderful wall')
w.user = User.first
w.save

puts 'make a booking'
b = Booking.new(date: Date.today)
b.wall = w
b.user = User.last
b.save

puts 'done'
