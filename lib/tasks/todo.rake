namespace :todo do
  desc "Destroys items older than 7 days"
  task delete_items: :environment do
    Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
