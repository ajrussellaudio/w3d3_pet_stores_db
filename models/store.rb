require_relative "../db/sql_runner"

class Store

  attr_reader :id, :name, :address, :type

  def initialize(options)
    @id      = options["id"].to_i
    @name    = options["name"]
    @address = options["address"]
    @type    = options["type"]
  end

  def save()
    sql = "INSERT INTO stores (name, address, type) VALUES ('#{@name}', '#{@address}', '#{@type}') RETURNING * ;"
    store = SqlRunner.run( sql ).first
    @id = store["id"].to_i
  end

  def pets()
    sql = "SELECT * FROM pets WHERE store_id = #{@id}"
    pets = SqlRunner.run( sql )
    return pets.map { |pet_info| Pet.new(pet_info) }
  end

end