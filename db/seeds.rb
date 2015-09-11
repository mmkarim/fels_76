10.times do |n|
  title = "Lesson #{n+1}"
  info = "something something something"
  Category.create(title: title, info: info)
end

categories = Category.order(:created_at).take(9)
50.times do |n|
  content = "Word #{n+1}"
  pronunciation = "Word #{n+1}'s pronunciation"
  categories.each {|category| category.words.create!(content: content, pronunciation: pronunciation)}
end

words = Word.all
4.times do |n|
  content = "Option #{n+1}"
  words.each {|word| word.choices.create!(content: content)}
end
