require_relative 'Graph.rb'
require_relative 'Vertex.rb'

class Parser
  attr_reader :input, :graphs_no, :type

  DEBUG=true
  
  def initialize
    @input = ''
    graphs_no = 0
  end
 
  def readInput
    while a = gets
      @input += a
    end
    puts @input if DEBUG
  end

  def parseInput
    lines = @input.split(/\n/)
    lineno=0

    @graphs_no = lines[lineno].to_i
    lineno+=1
    puts "Graphs # set to #{@graphs_no}" if DEBUG

    # Go through graphs
    (1..@graphs_no).each do |graph|
      if DEBUG
        puts "======================================================="
        puts "Graph #{graph} ::: contains #{lines[lineno]} records"
      end
      
      current_graph = Graph.new


      records = lines[lineno].to_i
      
      # Go through records in one graph
      start = lineno-1
      (lineno..lineno+records-1).each do |line|
        lineno += 1
        puts "    Record: #{line-start}: #{lines[lineno]}" if DEBUG
      end

      lineno+=1

      puts "" if DEBUG

      # Go through search requests
      while !lines[lineno].eql?("0 0")
        num = lines[lineno].split(" ")
        print "    Search: #{num[0]} using " if DEBUG
        if DEBUG
          if(num[1].to_i==0)
            puts "DFS"
          else 
            puts "BFS"
          end
        end

        lineno+=1
      end
      lineno+=1
    end



  end
end