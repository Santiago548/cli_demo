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
    end

    def print_drinks(dr)
        puts ""
        puts "Here are your drink with #{@ingredient}"
        puts ""
        dr.each.with_index(1) do | d, i |
            puts "#{i}. #{d.name}"
        end 
       

    end 

end