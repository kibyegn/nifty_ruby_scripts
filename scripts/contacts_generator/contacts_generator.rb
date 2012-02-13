#!/usr/bin/env ruby
require 'rubygems'
require 'fastercsv'

class ContactsGenerator
  
  def initialize
    @prefixes = ["0721", "0722", "0723", "0724", "0725", "0726", "0727", "0728",      "0729", "0710", "0711", "0712", "0713", "0714", "0715", "0716"]
    @digits_low = 100000
    @digits_high = 999999
    @female_first_names = FasterCSV.read('female_first_names.csv')
    @female_surnames = FasterCSV.read('female_surnames.csv')
    @male_first_names = FasterCSV.read('male_first_names.csv')
    @male_surnames = FasterCSV.read('male_surnames.csv')
  end
  
  # Generates random first name, middle name, last name, phone number combinations
  def generate_contacts(n)
    FasterCSV.open("contacts.csv", "w") do |csv|
      n.times do   
        phone_digits = rand(@digits_high-@digits_low) + @digits_low
        sex = phone_digits.even? ? "male" : "female"
        name = sex["female"] ? get_female_name : get_male_name     
        prefix = @prefixes[rand(@prefixes.size)]
        phone_number = prefix + (phone_digits.to_s)
        name << phone_number
        csv << name
      end
    end  
  end
  
  def get_female_name
    i_dub_thee = Array.new
    i_dub_thee << @female_first_names[rand(@female_first_names.size)]
    i_dub_thee << @female_surnames[rand(@female_surnames.size)]
    i_dub_thee << @female_surnames[rand(@female_surnames.size)]
    
    return i_dub_thee
  end
  
  def get_male_name
    i_dub_thee = Array.new
    i_dub_thee << @male_first_names[rand(@male_first_names.size)]
    i_dub_thee << @male_surnames[rand(@male_surnames.size)]
    i_dub_thee << @male_surnames[rand(@male_surnames.size)]
    
    return i_dub_thee
  end
end

ContactsGenerator.new.generate_contacts(10)
