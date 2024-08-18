# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "dataの作成を開始します"

taro = User.find_or_create_by!(email: "taro@example.com") do |user|
  user.name = "Taro"
  user.password = "password"
  # user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

genre_a = Genre.find_or_create_by!(name: "genre_a")

taro.posts.find_or_create_by!(title: "test") do |post|
  post.body = "aaaa"
  post.address = "iiiii"
  post.latitude = 1.0
  post.longitude = 2.0
  post.genre = genre_a
end

puts "dataの作成が完了しました"
