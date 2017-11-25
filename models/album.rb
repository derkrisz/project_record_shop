require_relative('../db/sql_runner.rb')

class album

attr_reader :id, :title, :quantity

def initialize(options)
  @id = options['id']
  @title = options['title']
  @quantity = options['quantity'].to_i
end

end
