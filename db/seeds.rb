User.destroy_all
Restaurant.destroy_all
Order.destroy_all

teste = User.new(
  first_name: "Teste",
  last_name: "Teste",
  email: "teste@teste.com",
  password: "123123",
  phone: "123456",
  birthday: DateTime.now - 10000
)

teste.save!

padoca = Restaurant.new(
  name: "Padoca",
  address: "Avenida Paulista 1000",
  category: "Padaria",
  phone: "123456"
  user_id: teste.id

  5.times do
    dish = Dish.new(
      price: rand(5..20),
      description: "Lorem ipsum bacon queijo",
    )

  end
)

padoca.save!

