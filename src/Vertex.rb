class Vertex
  attr_reader :status
  :st_open
  :st_close
  :st_fresh

  def initialize 
    @status = :st_fresh
  end
end