## interactions with user 
# contain all of our gets and puts 
# control flow of our program

class CLI

    def start 
        puts ""
        puts "Welcome to Drink Finder!"
        prompt_ingredient
        prompt
        inp = gets.strip.downcase
        while inp != 'exit' do 
            if inp == 'list'
                print_drinks(Ingredient.find_by_ingredient(@ingredient).drinks)
            elsif inp.to_i > 0 && inp.to_i <= Ingredient.find_by_ingredient(@ingredient).drinks.length
                drink = Ingredient.find_by_ingredient(@ingredient).drinks[inp.to_i - 1]
                if !drink.glass
                    API.get_drink_details(drink)
                    print_drink(drink)
                else
                    print_drink(Drink.find(drink)[0])
                end 
            elsif inp == 'ingredient'
                prompt_ingredient
            else 
                puts "I do not understand - please try again."
            end
            prompt
            inp = gets.strip.downcase
        end
        puts "Goodbye!"

    end

    def print_drinks(dr)
        puts ""
        puts "Here are your drinks with #{@ingredient}"
        puts ""
        dr.each.with_index(1) do | d, i |
            puts "#{i}. #{d.name}"
        end 
    end 

    def print_drink(drink)
        puts ""
        puts "#{drink.name} Recipe:"
        puts "-------------"
        puts "#{drink.glass}"
        puts "-------------"
        drink.ingredients.each_with_index do | ing, index |
            puts "#{ing} - #{drink.measures[index]}"
        end 
        puts "-------------"
        puts "#{drink.instructions}"
        puts ""

    end

    def prompt
        puts ""
        puts "Type a number listed to see more details"
        puts "OR type 'ingredient' to search for a new ingredient"
        puts "OR type 'list' to see the list again"
        puts "OR type 'exit' to exit"
        puts ""
    end 

    def prompt_ingredient
        puts ""
        puts "Search for drinks by entering an ingredient"
        puts ""
        @ingredient = gets.strip.downcase
        puts ""
        API.fetch_drinks(@ingredient)
        puts ""
        drinks = Ingredient.find_by_ingredient(@ingredient).drinks
        print_drinks(drinks)

    end 

end