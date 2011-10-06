class Vertex
  attr_reader :status, :connections
  :st_open
  :st_close
  :st_fresh

  def initialize 
    @connections = Hash.new
    @status = :st_fresh
  end

  def addConnection(i)
    puts "      Add connection #{i}" if Parser.DEBUG
    connections[i] = true
  end
end