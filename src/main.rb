require_relative 'Parser.rb'
require 'thread'

def DFS(graph, source) 
  source.status = :st_close
  print "#{source.value} "

  source.connections.each { |connection|
    vertex = graph.getVertex(connection[0])

    if(vertex.status == :st_fresh)
      vertex.status = :st_open
      vertex.connections.each { |c|
        v = graph.getVertex(c[0])
        DFS(graph, v) if v.status == :st_fresh
      }
      vertex.status = :st_close
    end
  }  
end

def BFS(graph, source) 
  source.status=:st_open

  queue = Queue.new
  queue.push(source)

  while(!queue.empty?)
    vertex = queue.pop
    print "#{vertex.value} "

    vertex.connections.each { |connection|
      v = graph.getVertex(connection[0])
      if v.status == :st_fresh
        v.status = :st_open
        queue.push(v)
      end
    }
    source.status=:st_closed
  end
  puts ""
  graph.refresh
end

parser = Parser.new
parser.readInput
graphs = parser.parseInput

i=1

graphs.each { |graph|
  puts "graph #{i}"
  i+=1
  graph.search_requests.each { |request|
    if(request.type==:BFS) 
      #BFS(graph, graph.getVertex(request.number.to_i))
    else
      DFS(graph, graph.getVertex(request.number.to_i))
      puts ""
      graph.refresh
    end
  }
}


