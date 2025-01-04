# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Admin Seed
# Admin Seed
Admin.first_or_create(name: "Alan", email: "alan@hotmail.com", password: "123456")

# Student Seeds
500.times do
  student_record = Student.create!(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 10, max_age: 18),
    telephone: "3120000000",
    email: Faker::Internet.email,
    password: "123456",
    grade: rand(1..6),
    group: ("A".."F").to_a.sample
  )

  student_record.photo.attach(io: File.open('/home/alan/Pictures/School/profile.jpg'), filename: 'profile.jpg')
end


# Teacher Seeds
50.times do
  teacher_record = Teacher.create!(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.birthday(min_age: 28, max_age: 65),
    telephone: "3120000000",
    email: Faker::Internet.email,
    password: "123456",
  )

  teacher_record.photo.attach(io: File.open('/home/alan/Pictures/School/profile.jpg'), filename: 'profile.jpg')
end

# Subject Seeds
[
  "Matemáticas I", "Español I", "Ciencias Naturales I", "Ciencias Sociales I", "Formación Cívica y Ética I", "Física I", "Inglés I", "Geografía I", "Historia I",
  "Matemáticas II", "Español II", "Ciencias Naturales II", "Ciencias Sociales II", "Formación Cívica y Ética II", "Física II", "Inglés II", "Geografía II", "Historia II",
  "Matemáticas III", "Español III", "Ciencias Naturales III", "Ciencias Sociales III", "Formación Cívica y Ética III", "Física III", "Inglés III", "Geografía III", "Historia III",
  "Matemáticas IV", "Español IV", "Ciencias Naturales IV", "Ciencias Sociales IV", "Formación Cívica y Ética IV", "Física IV", "Inglés IV", "Geografía IV", "Historia IV",
  "Matemáticas V", "Español V", "Ciencias Naturales V", "Ciencias Sociales V", "Formación Cívica y Ética V", "Física V", "Inglés V", "Geografía V", "Historia V",
  "Matemáticas VI", "Español VI", "Ciencias Naturales VI", "Ciencias Sociales VI", "Formación Cívica y Ética VI", "Física VI", "Inglés VI", "Geografía VI", "Historia VI"
].each do |name|
  Subject.create!(name_subject: name)
end
