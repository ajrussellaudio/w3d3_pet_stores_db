require_relative "../db/sql_runner"

class Pet

  attr_accessor :name, :type
  attr_reader :id

  def self.all()
    sql = "SELECT * FROM pets;"
    pets = SqlRunner.run( sql )
    return pets.map { |pet| Store.new(pet) }
  end

  def self.find( id )
    sql = "SELECT * FROM pets WHERE id = #{id};"
    pet = SqlRunner.run( sql ).first
    return pet
  end

  def initialize(options)
    @id   = options["id"].to_i
    @name = options["name"]
    @type = options["type"]
    @store_id = options["store_id"]
  end

  def save()
    sql = "INSERT INTO pets ( name, type, store_id ) 
    VALUES ( '#{@name}', '#{@type}', #{@store_id} ) RETURNING * ;"
    pet = SqlRunner.run( sql ).first
    @id = pet["id"].to_i
  end

  def store()
    sql = "SELECT * FROM stores WHERE id = #{@store_id}"
    store = SqlRunner.run( sql ).first
    return store
  end

  def update()
    sql = "UPDATE pets SET
      name = '#{@name}',
      type = '#{@type}'
      WHERE id = #{@id}
      RETURNING * ;"
    pet = SqlRunner.run( sql ).first
    return pet
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = #{@id} RETURNING * ;"
    pet = SqlRunner.run( sql ).first
    return pet
  end


end