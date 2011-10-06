require_relative 'Parser.rb'
require 'thread'

def BFS(graph, source) 
  source.status=:st_open

  queue = Queue.new
  queue.push(source)

  while(!queue.empty?)
    vertex = queue.pop
    p vertex

    vertex.connections.each { |connection|
      v = graph.getVertex(connection[0])
      if v.status == :st_fresh
        v.status == :st_open
        queue.push(v)
      end
    }
    source.status=:st_closed
  end
end

parser = Parser.new
parser.readInput
graphs = parser.parseInput

graphs.each { |graph|
  graph.search_requests.each { |request|
    BFS(graph, graph.getVertex(request.number.to_i))
  }
}


