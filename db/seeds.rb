require 'random_data'

 3.times do
   List.create!(
 # #2
     title:  RandomData.random_sentence,
   )
 end

 lists = List.all

 15.times do
   Todo.create!(
     list: lists.sample,
     title: RandomData.random_sentence
   )
 end

 testuser = User.create!(
    email: "testuser@example.com",
    password: "helloworld",
    password_confirmation: "helloworld"
 )

 puts "Seed finished"
 puts "#{List.count} lists created"
 puts "#{Todo.count} todo's created"
