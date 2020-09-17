# keep track of our drink
#turn our responses into objects
#save all drinks created
class Drink 
    attr_accessor :name, :drink_id
    @@all = []

    def initialize(name:, drink_id:)
        @name = name
        @drink_id = drink_id
        @@all << self
    end 

    def self.all
        @@all
    end

end 
