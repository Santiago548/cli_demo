# handle all of our API requests
class API 

    def self.fetch_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        binding.pry
        drinks = JSON.parse(response)["drinks"]
        drinks.each do |d|
            Drink.new(name: d["strDrink"], drink_id: d["idDrink"], ingredient: ingredient)
        end 
    end 

    def self.get_drink_details(drink)
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        drink = JSON.parse(response)["drinks"][0]
        binding.pry
    end 

end