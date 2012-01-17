require 'set'

class Person
  attr_accessor :id, :name
  
  def initialize(id, name)
    @id, @name = id, name
  end
end

def unique(list)
  seen = Set.new
  list.inject([]) do |kept, person|
    unless seen.include?(person.name)
      kept << person
      seen << person.name
    end
    kept
  end
end

list = []
list << Person.new(1, "Alex")
list << Person.new(2, "Julia")
list << Person.new(3, "Jerome")
list << Person.new(4, "Neal")
list << Person.new(5, "Jean")
list << Person.new(6, "Julia")
list << Person.new(7, "Alex")
list << Person.new(8, "Eric")

p list.length
p unique(list).length
