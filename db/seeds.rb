10.times do |n|
  title = "Lesson #{n+1}"
  info = "something something something"
  Category.create(title: title, info: info)
end

categories = Category.order(:created_at).take(9)
15.times do |n|
  content = "Word #{n+1}"
  pronunciation = "Word #{n+1}'s pronunciation"
  categories.each {|category| category.words.create!(content: content, pronunciation: pronunciation)}
end

words = Word.all
words.each {|word| word.choices.create!(content: "Option 0", correct: true)}
3.times do |n|
  content = "Option #{n+1}"
  words.each {|word| word.choices.create!(content: content)}
end

10.times do |n|
  name  = Faker::Name.name
  email = "abc-#{n+1}@abc.com"
  password = "123456"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
end

User.create!(name:  "Admin",
             email: "admin@admin.org",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)


users = User.order(:created_at).take(5)
5.times do |n|
  category_id = n+1
  users.each {|user| user.lessons.create!(category_id: category_id)}
end

users = User.all
user  = users.first
following = users[2..11]
followers = users[3..7]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}
