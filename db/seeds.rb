User.create!(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "password")
User.create!(first_name: "Brian", last_name: "Urlacher", email: "burlacher@gmail.com", password: "password")

Pantry.create!(name: "Joe's Kitchen", creator_id: 1)
Pantry.create!(name: "Brian's Kitchen", creator_id: 2)

PantryParticipation.create!(user_id: 1, pantry_id: 2)
PantryParticipation.create!(user_id: 2, pantry_id: 1)

Prototype.create!(name: "Cheese", shelf_life: 5)
Prototype.create!(name: "Milk", shelf_life: 10)

Item.create!(name: "Cheese", pantry_id: 1, prototype_id: 1)
Item.create!(name: "Milk", pantry_id: 2, prototype_id: 2)

