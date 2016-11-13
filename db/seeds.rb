# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Checkup.create(start_time: DateTime.now, user: User.last)
#Checkup.create(start_time: DateTime.tomorrow, user: User.last)

f1 = Formula.create(name: "En ligne",
                    comment: "Votre suivi en quelques clics!",
                    price: 100,
                    photo_url: "http://res.cloudinary.com/dpilgpat0/image/upload/v1479037650/hellodiet/formulas/computer.jpg",
                    number_of_sessions: 10)

f2 = Formula.create(name: "A domicile",
                    comment: "Votre suivi chez vous",
                    price: 200,
                    photo_url: "http://res.cloudinary.com/dpilgpat0/image/upload/v1479037579/hellodiet/formulas/advice.jpg",
                    number_of_sessions: 15)

f3 = Formula.create(name: "Santé",
                    comment: "Formule santé",
                    price: 300,
                    photo_url: "http://res.cloudinary.com/dpilgpat0/image/upload/v1479037631/hellodiet/formulas/sport.jpg",
                    number_of_sessions: 20)
