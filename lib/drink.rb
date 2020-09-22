# keeps track of our drinks
# turn our responses into objects
# save all drinks created
class Drink 
    attr_accessor :name, :drink_id, :ingredient, :instructions, :ingredients, :glass, :measures
    @@all = []

    def initialize(name:, drink_id:, ingredient:)
        @name = name
        @drink_id = drink_id
        @ingredients = []
        @measures = []
        @ingredient = ingredient
        @@all << self
    end 

    def self.all
        @@all
    end

   def self.find(drink)
    @@all.select { |d| d == drink}
   end 
end 
