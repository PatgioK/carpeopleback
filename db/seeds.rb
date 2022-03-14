# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

People.create! [
    {firstname: 'Josh' lastname: 'Brolin' email: 'jb@gmail.com'},
    {firstname: 'Emily' lastname: 'Blunt' email: 'EmilyB@gmail.com'},
    {firstname: 'Benicio' lastname: 'Del-Toro' email: 'Sicario@gmail.com'}
]

Cars.create! [
    {year: '2019' make: 'Audi' model: 'R8' price: '167000' person_id: '1'}
    {year: '2010' make: 'Toyota' model: 'Camry' price: '6500' person_id: '2'}
    {year: '2009' make: 'Honda' model: 'Civic' price: '4500' person_id: '3'}
    {year: '2017' make: 'BMW' model: 'X5' price: '15000' person_id: '2'}
]