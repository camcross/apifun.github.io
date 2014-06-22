require 'rest-client'
require 'json'

puts "Hello! Welcome to Pokemon Battle Arena!"

players = {"player_one" => {}, "player_two" => {}}

#Greet players
players.each do |player, data|
	x = 1
	puts "Trainer #{x}, please enter your name: "
	"#{player}["name"]" = gets.strip
	puts "Welcome, #{player}["name"]!"
	x +=1
end	

#Get Pokemon for Player 1
players.each do |player, values|
	puts "Trainer #{player}[name], please enter the Pokedex number of your pokemon(1-101): "
	x = gets.strip
	puts "Fetching your Pokeball now..."
	data = RestClient.get("http://pokeapi.co/api/v1/pokemon/#{x}/")
	"#{player}["parsed_data"]" = JSON.parse(data)
	"#{player}["pokemon"]" = "#{player}["parsed_data"]["name"]"
	puts "Your pokemon is #{player}["pokemon"]"
end	


# puts "Trainer #{name_one}, please enter the Pokedex number of your pokemon(1-101): "
# x = gets.strip
# puts "Great choice! Fetching your Pokeball now..."
# data = RestClient.get("http://pokeapi.co/api/v1/pokemon/#{x}/")
# parsed_data_one = JSON.parse(data)
# pokemon_one = parsed_data_one["name"]
# puts "Your pokemon is #{pokemon_one}!"

# #Get Pokemon for Player 2
# puts "Trainer #{name_two}, please enter the Pokedex number of your pokemon(1-101): "
# x = gets.strip
# puts "Great choice! Fetching your Pokeball now..."
# data = RestClient.get("http://pokeapi.co/api/v1/pokemon/#{x}/")
# parsed_data_two = JSON.parse(data)
# pokemon_two = parsed_data_two["name"]
# puts "Your pokemon is #{pokemon_two}!"

# #TODO: Find a way to let each player pick a random move
# #- Let each player know how many moves are available, and have him pick a number within that range

# #while (hp_one > 0 && hp_two > 0)
# 	puts "Trainer #{name_one}, choose your move! #{pokemon_one} has #{parsed_data_one["moves"].size} 
# 		moves. Which will you use?"
# 	num_one = gets.strip.to_i	
# 	move_one = parsed_data_one["moves"][num_one-1]["name"]
# 	puts "Trainer #{name_one}: \"#{pokemon_one}, use #{move_one}!\""
# 	puts "#{pokemon_one} used #{move_one}!"

# 	#- Calculates each move's damage
# 	url_one = parsed_data_one["moves"][num_one-1]["resource_uri"]
# 	more_info_one = RestClient.get("http://pokeapi.co#{url_one}")
# 	parsed_move_one = JSON.parse(more_info_one)
# 	power_one = parsed_move_one["power"]

# 	#Subtract damage from other pokemon's hp and put how much hp the pokemon has left

# 	#Repeat for Player 2
# 	puts "Trainer #{name_two}, choose your move! #{pokemon_two} has #{parsed_data_two["moves"].size} 
# 		moves. Which will you use?"
# 	num_two = gets.strip.to_i	
# 	move_two = parsed_data_two["moves"][num_two-1]["name"]
# 	puts "Trainer #{name_two}: \"#{pokemon_two}, use #{move_two}!\""


# 	#- Calculates each move's damage
# 	url_two = parsed_data_two["moves"][num_two-1]["resource_uri"]
# 	more_info_two = RestClient.get("http://pokeapi.co#{url_two}")
# 	parsed_move_two = JSON.parse(more_info_two)
# 	power_two = parsed_move_two["power"]

# 	#If power is zero, no damage is inflicted on the pokemon that turn
# 	if (power_one == 0)
# 		puts "#{pokemon_one} successfully defends #{move_two}, no damage is done!"
# 	else	
# 		puts "#{move_two} inflicts #{power_two} damage on #{pokemon_one}!"	
# 	end	
# 	if (power_two == 0)
# 		puts "#{pokemon_two} successfully defends #{move_one}, no damage is done!"
# 	else
# 		puts "#{move_one} inflicts #{power_one} damage on #{pokemon_two}!"	
# 	end	
# #end			

# #-->Be sure to add multipliers based on Pokemon type (water x2 against fire, e.g.)
# #- Continue until one Pokemon has 0 HP

# #Refactor code to make a hash of two players, and alter the code to make it a do-each loop