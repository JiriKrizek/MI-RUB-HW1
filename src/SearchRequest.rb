class SearchRequest
  attr_reader :number, :type

  def initialize(i, type)
    @number = i
    @type = type
  end

  def to_s
    print "Search Request: find: #{@number} using #{@type} "
  end

end