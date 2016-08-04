require_relative "../db/sql_runner"

class Store

  attr_accessor :name, :address, :type
  attr_reader :id

  def Store.all()
    sql = "SELECT * FROM stores;"
    stores = SqlRunner.run( sql )
    return stores.map { |store| Store.new(store) }
  end

  def self.find( id )
    sql = "SELECT * FROM stores WHERE id = #{id};"
    store = SqlRunner.run( sql ).first
    return store
  end

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

  def update()
    sql = "UPDATE stores SET
      name = '#{@name}',
      address = '#{@address}',
      type = '#{@type}'
      WHERE id = #{@id}
      RETURNING * ;"
    SqlRunner.run( sql )
    return self
  end

  def delete()
    sql = "DELETE FROM stores WHERE id = #{@id};"
    SqlRunner.run( sql )
    return nil
  end


  def pets()
    sql = "SELECT * FROM pets WHERE store_id = #{@id};"
    pets = SqlRunner.run( sql )
    return pets.map { |pet_info| Pet.new(pet_info) }
  end

end