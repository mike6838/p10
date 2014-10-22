module Seed
  def self.populate
    20.times do
      first_name = Faker::Name.name.split(' ')[0]
      last_name = Faker::Name.name.split(' ')[1]
      User.create(firstname: first_name, lastname: last_name, email: Faker::Internet.email, password: 'password')
    end

    User.all.each do |user|
      user.comments.create(content: Faker::Lorem.sentence(3))
    end
  end
end