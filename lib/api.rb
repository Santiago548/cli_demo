# handle all of our API requests
class API 

    def self.fetch_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        drinks = JSON.parse(response)["drinks"]
        drinks.each do |d|
            Drink.new(name: d["strDrink"], drink_id: d["idDrink"])
        end 
    end 

end