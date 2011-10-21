#!/usr/bin/env ruby

class PwGen
  def generate_random_string(length=10)
    o =  [(0..9),('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    return (0...length).map{ o[rand(o.length)]  }.join
  end
end

puts PwGen.new.generate_random_string
