require_relative "../db/sql_runner"

class Pet

  attr_reader :id, :name, :type

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


end