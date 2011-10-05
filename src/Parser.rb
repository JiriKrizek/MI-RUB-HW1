
class Parser
  attr_reader :input, :graphs_no

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
    p lines[0]

    @graphs_no = lines[0]
    puts "Graphs # set to #{@graphs_no}" if DEBUG
  end
end

parser = Parser.new
parser.readInput
parser.parseInput