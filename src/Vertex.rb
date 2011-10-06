class Vertex
  attr_reader :connections
  attr_accessor :status
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