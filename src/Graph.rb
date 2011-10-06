class Graph
  attr_reader :vertices_count, :vertices

  def initialize(vertices_count)
    @vertices = Hash.new
    for i in 1..vertices_count 
      @vertices[i] = Vertex.new()
    end
  end

  def to_s
    puts "Graph contains vertices: #{@vertices}"
  end

  def connectVertices(i, j)
    return if j<1 # "No connections, ignoring"
    if vertices[i]==nil
      puts "      Vertices [#{i}] is null, creating new array"
      vertices[i] = []
    end
    vertices[i].addConnection j
  end
end