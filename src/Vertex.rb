class Vertex
  attr_reader :connections
  attr_accessor :status, :value
  :st_open
  :st_close
  :st_fresh

  def initialize value
    @connections = Hash.new
    @status = :st_fresh
    @value = value
  end

  def addConnection(i)
    puts "      Add connection #{i}" if Parser.DEBUG
    connections[i] = true
  end
end