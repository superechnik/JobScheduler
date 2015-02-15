class Part < ActiveRecord::Base

  has_many :jobs


  attr_accessor :rate
  attr_accessor :std_people

  def initialize (part_id, rate, std_people)
    @part_id = part_id
    @rate = rate
    @std_people = std_people
  end

  def self.rate
    return rate
  end

  def self.std_people
    return std_people
  end


end