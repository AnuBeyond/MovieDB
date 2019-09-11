#create super admin account
User.first_or_create(email: 'admin@example.com', password: "000000", admin: true)

# create demo movie categories
categories = [['Action', ''],['Drama', ''], ['Comedy', ''], ['Horror', ''], ['Crime', ''], ['Documentory', '']]
categories.each do |name, parent|
c = Category.create(
    name: name,
    parent_id: parent
  )
end

# #creating demo movies
movies = [[1, 'Avengers', 'avengers.png'], [1, 'Iron Man', 'iron-man.png'], [1, 'John Wick', 'john-wick.png'], [2, 'The Gift', 'gift.png'], [2, 'Mountain Between Us', 'mountain.png'],
[6, 'March Of The Penguines', 'penguine.png'], [4, 'Insomina', 'insomina.png'], [6, 'Space Tourist', 'space-tourist.png'], [6, 'Score', 'score.png']]
text = 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock,
a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical
literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.
This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in
their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.'
movies.each do |category_id, title, image|
  b = Movie.create(
      user_id: 1,
      category_id: category_id,
      title: title,
      text: text,
      crop_x: '0',
      crop_y: '0',
      crop_w: '270',
      crop_h: '370'
    )
  b.image.attach(io: File.open(Rails.root.join('app/assets/images/seed/'+image)), filename: image)
end
