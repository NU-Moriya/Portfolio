# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin",
             account_name: "admin",
             classification: 0,
             is_valid: true,
             email: ENV['ADMIN_EMAIL'],
             password: ENV['ADMIN_PASSWORD'],
             password_confirmation: ENV['ADMIN_PASSWORD'] ,
             admin: true)
             
User.create!(name: "かぼちゃん",
             account_name: "pumpkin",
             classification: 0,
             is_valid: true,
             email: "b@b",
             password: "000000",
             password_confirmation: "000000",
             admin: false)
             
User.create!(name: "インカのめざめ",
             account_name: "potato",
             classification: 0,
             is_valid: true,
             email: "c@c",
             password: "000000",
             password_confirmation: "000000",
             admin: false)
             
User.create!(name: "のぶちん",
             account_name: "nobuchi",
             classification: 0,
             is_valid: true,
             email: "d@d",
             password: "000000",
             password_confirmation: "000000",
             admin: false)
             
User.create!(name: "ずんちゃん",
             account_name: "zunchin",
             classification: 0,
             is_valid: true,
             email: "e@e",
             password: "000000",
             password_confirmation: "000000",
             admin: false)

User.create!(name: "ねっち",
             account_name: "sakane",
             classification: 0,
             is_valid: true,
             email: "f@f",
             password: "000000",
             password_confirmation: "000000",
             admin: false)
             