class Graph
  attr_reader :vertices_count, :vertex, :search_requests

  def initialize(vertices_count)
    @vertex = Hash.new
    for i in 1..vertices_count 
      @vertex[i] = Vertex.new()
    end
    @search_requests = []
  end

  def to_s
    puts "Graph contains vertices: #{@vertices}"
  end

  def connectVertices(i, j)
    return if j<1 # "No connections, ignoring"
    if vertex[i]==nil
      puts "      Vertices [#{i}] is null, creating new array"
      vertex[i] = []
    end
    vertex[i].addConnection j
  end

  def addSearchRequest(searchReq)
    puts "#{searchReq.to_s}" if Parser.DEBUG
    search_requests.push(searchReq)
  end

  public 
    def getVertex(i)
      return vertex[i]
    end
end