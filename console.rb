require_relative "./models/pet"
require_relative "./models/store"

require "pry-byebug"

store1 = Store.new({
  "name"    => "Big Al''s Exotic Pets",
  "address" => "37 Castle Terrace",
  "type"    => "exotic"
  })
store2 = Store.new({
  "name"    => "Marj''s Cat Cafe",
  "address" => "42 Byres Road",
  "type"    => "cats"
  })

store1.save
store2.save

store2.address = "138 Great Western Road"
store2.update

pet1 = Pet.new({
  "name"     => "Bacon",
  "type"     => "python",
  "store_id" => store1.id
  })
pet2 = Pet.new({
  "name"     => "Pinky",
  "type"     => "axolotl",
  "store_id" => store1.id
  })
pet3 = Pet.new({
  "name"     => "Garfield",
  "type"     => "cat",
  "store_id" => store2.id
  })

pet1.save
pet2.save
pet3.save

binding.pry
nil