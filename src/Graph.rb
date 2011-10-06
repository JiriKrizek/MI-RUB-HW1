class Graph
  attr_reader :vertices_count, :vertices

  def initialize(vertices_count)
    @vertices = Hash.new
  end

  def to_s
    puts "Graph contains #{@vertices} vertices"
  end

  def connectVertices(i, j)
    return if j<1 # "No connections, ignoring"
    if vertices[i]==nil
      puts "      Vertices [#{i}] is null, creating new array"
      vertices[i] = []
    end
    vertices[i] << j
    puts "      Adding #{j}"
  end
end