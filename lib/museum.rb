require 'pry'
class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
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
end
