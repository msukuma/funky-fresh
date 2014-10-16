User.create!(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "password")
User.create!(first_name: "Brian", last_name: "Urlacher", email: "burlacher@gmail.com", password: "password")

Pantry.create!(name: "Joe's Kitchen")
Pantry.create!(name: "Brian's Kitchen")

PantryParticipations.create!(user: 1, pantry: 2)
PantryParticipations.create!(user: 2, pantry: 1)

Item.create!(name: "Cheese", pantry: 1, prototype: 1)
Item.create!(name: "Milk", pantry: 2, prototype: 2)

Prototype.create!(name: "Cheese", shelf_life: 5)
Prototype.create!(name: "Milk", shelf_life: 10)
