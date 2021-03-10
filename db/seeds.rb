
puts "Limpando base..."

User.destroy_all

puts "Criando usuario teste..."
teste = User.new(
  first_name: "Teste",
  last_name: "Teste",
  email: "teste@teste.com",
  password: "123123",
  phone: "123456",
  birthday: DateTime.now - 10000
)
teste.photo.attach(io: File.open('app/assets/images/dwight.jpg'), filename: 'dwight.jpg', content_type: 'image/jpg')
teste.save!

puts "Criando padoca..."
padoca = Restaurant.new(
  name: "Padoca",
  address: "Avenida Paulista 1000, São Paulo",
  category: "Padaria",
  phone: "123456",
  user_id: teste.id
)
padoca.photo.attach(io: File.open('app/assets/images/padaria.png'), filename: 'padaria.png', content_type: 'image/png')
padoca.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Misto quente", "Empadinha", "Beirute", "Pão na chapa", "Bolovo", "Enroladinho"].sample,
    price: rand(5..20),
    description: "Lorem ipsum bacon queijo",
    restaurant_id: padoca.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/pao.jpg'), filename: 'pao.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

  order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"

end

puts "Criando japones..."
japones = Restaurant.new(
  name: "Japonês",
  address: "Alameda Franca 241, São Paulo",
  category: "Japonesa",
  phone: "123456",
  user_id: teste.id
)
japones.photo.attach(io: File.open('app/assets/images/restaurante-japones.jpg'), filename: 'restaurante-japones.jpg', content_type: 'image/jpg')
japones.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Temaki", "Sushi", "Hossomaki", "Tempurá", "Lamen", "Gyoza"].sample,
    price: rand(5..20),
    description: "Lorem ipsum arroz peixe",
    restaurant_id: japones.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/temaki.jpg'), filename: 'temaki.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

  order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"
end

puts "Criando boteco..."
boteco = Restaurant.new(
  name: "Boteco",
  address: "Avenida Brigadeiro Luís Antônio, 2642, São Paulo",
  category: "Brasileira",
  phone: "123456",
  user_id: teste.id
)
boteco.photo.attach(io: File.open('app/assets/images/logo_lanchonete.jpg'), filename: 'logo_lanchonete.jpg', content_type: 'image/jpg')
boteco.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Feijoada", "PF com ovo", "Bife com batata frita", "X-Canaleta", "Salada duvidosa", "Arroz e feijão"].sample,
    price: rand(5..20),
    description: "Lorem ipsum podrão duvidoso",
    restaurant_id: boteco.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/marmita.jpg'), filename: 'marmita.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

  order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"
end


puts "Criando pizzaria..."
pizzaria = Restaurant.new(
  name: "Pizzaria",
  address: "Rua Arthur Prado, 394, São Paulo",
  category: "Pizza",
  phone: "123456",
  user_id: teste.id
)
pizzaria.photo.attach(io: File.open('app/assets/images/pizzaria.jpeg'), filename: 'pizzaria.jpeg', content_type: 'image/jpeg')

pizzaria.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Margherita", "Mussarela", "Pepperoni", "Portuguesa", "Catupiry", "Quatro queijos"].sample,
    price: rand(5..20),
    description: "Lorem ipsum massa molho de tomate",
    restaurant_id: pizzaria.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/pizza.jpg'), filename: 'pizza.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"
end

puts "Criando arabe..."
arabe = Restaurant.new(
  name: "Arebaba",
  address: "Rua Antônio Carlos, 282, São Paulo",
  category: "Árabe",
  phone: "123456",
  user_id: teste.id
)
arabe.photo.attach(io: File.open('app/assets/images/rest-arabe.jpg'), filename: 'rest-arabe.jpg', content_type: 'image/jpg')
arabe.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Kebab", "Esfiha", "Kibe", "Homus", "Kafta", "Babaganush"].sample,
    price: rand(5..20),
    description: "Lorem ipsum esfiha aberta",
    restaurant_id: arabe.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/esfiha.jpg'), filename: 'esfiha.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

  order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"
end

puts "Criando chines..."
chines = Restaurant.new(
  name: "Chinchin",
  address: "Alameda Itu, 1048, São Paulo",
  category: "Chinesa",
  phone: "123456",
  user_id: teste.id
)
chines.photo.attach(io: File.open('app/assets/images/chines.jpg'), filename: 'chines.jpg', content_type: 'image/jpg')
chines.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Yakissoba", "Arroz chop suey", "Frango Xadrez", "Dumpling", "Bolinho de carne", "Arroz frito"].sample,
    price: rand(5..20),
    description: "Lorem ipsum macarrão agridoce",
    restaurant_id: chines.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/chinesa.jpg'), filename: 'chinesa.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

  order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"
end

puts "Criando italiano..."
italiano = Restaurant.new(
  name: "Cantina de La Nonna",
  address: "Rua Manoel Dutra, 208, São Paulo",
  category: "Italiana",
  phone: "123456",
  user_id: teste.id
)
italiano.photo.attach(io: File.open('app/assets/images/italiano.png'), filename: 'italiano.png', content_type: 'image/png')
italiano.save!

puts "Criando pratos..."
5.times do
  dish = Dish.new(
    name: ["Espaguete à Bolonhesa ", "Penne ao Limone", "Tagliarini ao Sugo", "Espaguete com Almôndegas"].sample,
    price: rand(5..20),
    description: "Lorem ipsum macarrão com tomate",
    restaurant_id: italiano.id,
    quantity: 3,
    start_time: Time.now,
    end_time: Time.now + 30000,
    rating: rand(1..5)
  )
  dish.photo.attach(io: File.open('app/assets/images/italianoa.jpg'), filename: 'italianoa.jpg', content_type: 'image/jpg')
  dish.save!
  puts "Prato #{dish.id} criado!"

  order = Order.new(
    rating: rand(1..5),
    user_id: teste.id,
    dish_id: dish.id
  )

  if order.rating == 1
    order.rating_description = "Jamais pediria novamente. Comida horrível. Não peçam!"
  elsif order.rating == 2
    order.rating_description = "Bem fraco, não gostei. Melhoraria a embalagem da entrega"
  elsif order.rating == 3
    order.rating_description = "Gostoso! Recomendo o prato! Podem pedir sem medo"
  elsif order.rating <= 5
    order.rating_description = "Prato sensacional, recomendo para todos! Peçam sempre que disponível"
  end

  order.save!

  puts "Salvando ordem do prato #{order.dish.id}"
end
