## interactions with user 
# contain all of our gets and puts 
# control flow of our program

class CLI

    def start 
        puts ""
        puts "Welcome to Drink Finder!"
        puts ""
        puts "Search for drink by entering an ingredient"
        puts ""
        @ingredient = gets.strip.downcase
        puts ""
        API.fetch_drinks(@ingredient)
        puts ""
        drinks = Drink.all
        print_drinks(drinks)
        puts ""
        puts "Type a number listed to see more details or type 'exit' to exit"
        puts ""
        inp = gets.strip.downcase
        while inp != 'exit' do 
            drink = Drink.find_by_ingredient(@ingredient)[inp.to_i - 1]
            API.get_drink_details(drink)
        end

    end

    def print_drinks(dr)
        puts ""
        puts "Here are your drinks with #{@ingredient}"
        puts ""
        dr.each.with_index(1) do | d, i |
            puts "#{i}. #{d.name}"
        end 
       

    end 

end