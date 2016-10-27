require 'random_data'

 3.times do
   User.create!(
   email: RandomData.random_email,
   password: RandomData.random_sentence
   )
 end

 users= User.all

 3.times do
   List.create!(
     user: users.sample,
     title:  RandomData.random_sentence,
   )
 end

 lists = List.all

 15.times do
   Todo.create!(
     user: users.sample,
     list: lists.sample,
     title: RandomData.random_sentence
   )
 end

 todos = Todo.all

 testuser = User.create!(
    email: "testuser@example.com",
    password: "helloworld",
    password_confirmation: "helloworld"
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{List.count} lists created"
 puts "#{Todo.count} todos created"
