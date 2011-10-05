
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
      puts "======================================================="
      puts "Graph #{graph}, lineno: #{lineno} ::: #{lines[lineno]}"
      records = lines[lineno].to_i
      puts "  Records #{records}"
      
      # Go through records in one graph
      start = lineno-1
      (lineno..lineno+records-1).each do |line|
        lineno += 1
        puts "    Record: #{line-start}: #{lines[lineno]}"
      end

      lineno+=1

      puts ""

      # Go through search requests
      while !lines[lineno].eql?("0 0")
        num = lines[lineno].split(" ")
        print "    Search: #{num[0]} using "
        if(num[1].to_i==0)
          puts "DFS"
        else 
          puts "BFS"
        end

        lineno+=1
      end
      lineno+=1
    end



  end
end

parser = Parser.new
parser.readInput
parser.parseInput