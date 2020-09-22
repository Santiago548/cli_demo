# handle all of our API requests
class API 

    def self.fetch_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        
        drinks = JSON.parse(response)["drinks"]
        new_ingredient = Ingredient.new(ingredient)
        drinks.each do |d|
            new_drink = Drink.new(name: d["strDrink"], drink_id: d["idDrink"], ingredient: ingredient)
            new_ingredient.drinks << new_drink
        end 
        binding.pry
         
    end 

    def self.get_drink_details(drink)
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)["drinks"][0]
        drink.glass = data["strGlass"]
        drink.instructions = data["strInstructions"]
        data.keys.each do |k|
            drink.ingredients << data[k] if (k.include?("Ingredient")) && data[k]
            drink.measures << data[k] if (k.include?("Measure")) && data[k]
        end 
        binding.pry
       
    end 

end