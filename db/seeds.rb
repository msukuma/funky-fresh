User.create!(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "password")
User.create!(first_name: "Brian", last_name: "Urlacher", email: "burlacher@gmail.com", password: "password")

Pantry.create!(name: "Joe's Kitchen", creator_id: 1)
Pantry.create!(name: "Brian's Kitchen", creator_id: 2)

PantryParticipation.create!(user_id: 1, pantry_id: 2)
PantryParticipation.create!(user_id: 2, pantry_id: 1)

Prototype.create!(name: "cheese", shelf_life: 5)
Prototype.create!(name: "milk", shelf_life: 10)
Prototype.create!(name: "orange", shelf_life: 4)
Prototype.create!(name: "beef", shelf_life: 2)
Prototype.create!(name: "chicken", shelf_life: 2)
Prototype.create!(name: "pork", shelf_life: 2)
Prototype.create!(name: "eggs", shelf_life: 16)

Item.create!(pantry_id: 1, prototype_id: 1)
Item.create!(pantry_id: 2, prototype_id: 2)
Item.create!(pantry_id: 1, prototype_id: 3)
Item.create!(pantry_id: 2, prototype_id: 4)
Item.create!(pantry_id: 1, prototype_id: 5)
Item.create!(pantry_id: 2, prototype_id: 6)
