# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "#{ENV['ADMIN_EMAIL']}", password: "#{ENV['ADMIN_PASSWORD']}")

Tag.create!([
  { name: '家族' },
  { name: '友人' },
  { name: '職場' },
  { name: '自分' },
  { name: 'お菓子' },
  { name: '食品' },
  { name: '飲料品' },
  { name: '美容・化粧品' },
  { name: '雑貨・趣味' },
  { name: 'その他' }
])


hoshino = User.find_or_create_by!(email: "hoshino@example.com") do |user|
  user.name = "干野"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  user.gender = "female"
  user.birth_year = "1980"
  user.birth_month = "12"
  user.is_deleted = "false"
  user.prefecture = "東京都"
end

shibaseki = User.find_or_create_by!(email: "shibaseki@example.com") do |user|
  user.name = "芝関"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
  user.gender = "male"
  user.birth_year = "1970"
  user.birth_month = "3"
  user.is_deleted = "false"
  user.prefecture = "埼玉県"
end

saku = User.find_or_create_by!(email: "saku@example.com") do |user|
  user.name = "朔"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
  user.gender = "others"
  user.birth_year = "1999"
  user.birth_month = "11"
  user.is_deleted = "false"
  user.prefecture = "北海道"
end

nisshin = User.find_or_create_by!(email: "nisshin@example.com") do |user|
  user.name = "日進"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
  user.gender = "female"
  user.birth_year = "1950"
  user.birth_month = "5"
  user.is_deleted = "false"
  user.prefecture = "福井県"
end

goro = User.find_or_create_by!(email: "goro@example.com") do |user|
  user.name = "五郎"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
  user.gender = "male"
  user.birth_year = "1960"
  user.birth_month = "7"
  user.is_deleted = "false"
  user.prefecture = "和歌山県"
end


PostImage.find_or_create_by!(name: "ランプ") do |post_image|
  post_image.my_comment = "小樽で衝動買いしました。部屋の雰囲気ががらっと変わります。"
  post_image.prefecture = "北海道"
  post_image.way_of_getting = "buy"
  post_image.price = "15000"
  post_image.user = saku
end

PostImage.find_or_create_by!(name: "マンゴーとパイン") do |post_image|
  post_image.my_comment = "家族旅行で買いました。甘くて美味しい！"
  post_image.prefecture = "宮崎県"
  post_image.way_of_getting = "buy"
  post_image.price = "8000"
  post_image.user = hoshino
end

PostImage.find_or_create_by!(name: "縁起物クッキー") do |post_image|
  post_image.my_comment = "職場の同僚からの頂き物です。意外とおいしかったです。"
  post_image.prefecture = "静岡県"
  post_image.way_of_getting = "receive"
  post_image.price = nil
  post_image.user = nisshin
end

PostImage.find_or_create_by!(name: "桜餅") do |post_image|
  post_image.my_comment = "旅先で食べておいしかったので家族へのお土産に。日持ちしないので注意。"
  post_image.prefecture = "京都府"
  post_image.way_of_getting = "buy"
  post_image.price = "900"
  post_image.user = nisshin
end

PostImage.find_or_create_by!(name: "ワイン") do |post_image|
  post_image.my_comment = "山梨旅行に行った家族から貰いました。今度自分でも購入します。"
  post_image.prefecture = "山梨県"
  post_image.way_of_getting = "receive"
  post_image.price = nil
  post_image.user = shibaseki
end

PostImage.find_or_create_by!(name: "春色アイシャドー") do |post_image|
  post_image.my_comment = "落ち着いた色なので使いやすくて便利です！期間限定でした。"
  post_image.prefecture = "石川県"
  post_image.way_of_getting = "buy"
  post_image.price = "2800"
  post_image.user = hoshino
end

PostImage.find_or_create_by!(name: "風鈴") do |post_image|
  post_image.my_comment = "音色が涼やかで気に入っています。"
  post_image.prefecture = "埼玉県"
  post_image.way_of_getting = "buy"
  post_image.price = "1500"
  post_image.user = saku
end

PostImage.find_or_create_by!(name: "だるま") do |post_image|
  post_image.my_comment = "上司が買ってきて職場に置いてあります。"
  post_image.prefecture = "群馬県"
  post_image.way_of_getting = "receive"
  post_image.price = nil
  post_image.user = goro
end

PostImage.find_or_create_by!(name: "肉まん") do |post_image|
  post_image.my_comment = "出張先で見かけたので。評判通りうまかったので大阪に立ち寄ったらぜひ。"
  post_image.prefecture = "大阪府"
  post_image.way_of_getting = "buy"
  post_image.price = "400"
  post_image.user = shibaseki
end

PostImage.find_or_create_by!(name: "シュウマイ") do |post_image|
  post_image.my_comment = "出張帰りの新幹線で食べました。おすすめです。"
  post_image.prefecture = "神奈川県"
  post_image.way_of_getting = "buy"
  post_image.price = "800"
  post_image.user = goro
end