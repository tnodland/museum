require 'pry'
class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def reccommend_exhibits(patron)
    reccommended_exhibits = []

    patron_interests = []
    patron.interests.each {|interest| patron_interests << interest}

    exhibits.each do |exhibit|
      if patron_interests.include?(exhibit.name)
        reccommended_exhibits << exhibit
      end
    end
    reccommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    hash = Hash.new

    exhibits.each do |exhibit|
      hash[exhibit] = []
    end

    hash.each do |exhibit, patrons|
      if patrons.each {|interests| interests.include?(exhibit.name)}
        hash[exhibit] = patrons
      end
    end
    binding.pry
    hash
  end
end
