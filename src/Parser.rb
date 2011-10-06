require_relative 'Graph.rb'
require_relative 'Vertex.rb'
require_relative 'SearchRequest.rb'

class Parser
  attr_reader :input, :graphs_no, :type
  :DFS
  :BFS

  @@DEBUG = TRUE

  def self.DEBUG
    @@DEBUG
  end

  def initialize
    @input = ''
    graphs_no = 0
  end
 
  def readInput
    while a = gets
      @input += a
    end
    puts @input if Parser.DEBUG
  end

  def parseInput
    lines = @input.split(/\n/)
    lineno=0

    @graphs_no = lines[lineno].to_i
    lineno+=1
    puts "Graphs # set to #{@graphs_no}" if Parser.DEBUG

    graphs = []
    # Go through graphs
    (1..@graphs_no).each do |graph|
      if Parser.DEBUG
        puts "======================================================="
        puts "Graph #{graph} ::: contains #{lines[lineno]} records"
      end
      
      current_graph = Graph.new(lines[lineno].to_i)


      records = lines[lineno].to_i
      
      # Go through records in one graph
      start = lineno-1
      (lineno..lineno+records-1).each do |line|
        lineno += 1
        #puts "    Record: #{line-start}: #{lines[lineno]}" if DEBUG
        record = lines[lineno].split
        puts "    Vertice #{record[0]}" if Parser.DEBUG
        (1..record.length-1).each do |i|
          current_graph.connectVertices(record[0].to_i, record[i].to_i)
        end
      end

      lineno+=1

      puts "" if Parser.DEBUG

      # Go through search requests
      while !lines[lineno].eql?("0 0")
        num = lines[lineno].split(" ")
        if Parser.DEBUG
          if(num[1].to_i==0)
            current_graph.addSearchRequest(SearchRequest.new(num[0], :DFS))
          else 
            current_graph.addSearchRequest(SearchRequest.new(num[0], :BFS))
          end
        end

        lineno+=1
      end
      lineno+=1

      graphs.push(current_graph)
    end
    graphs  
  end
end