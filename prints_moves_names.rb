require 'rest-client'
require 'json'

puts "Hello! Welcome to Pokemon Battle Arena!"

#Greet Player 1
puts "Trainer 1, please enter your name: "
name_one = gets.strip
puts "Welcome, Trainer #{name_one}!"

#Greet Player 2
puts "Trainer 2, please enter your name: "
name_two = gets.strip
puts "Welcome, Trainer #{name_two}!"

#Get Pokemon for Player 1
puts "Trainer #{name_one}, please enter the Pokedex number of your pokemon(1-101): "
x = gets.strip
puts "Great choice! Fetching your Pokeball now..."
data = RestClient.get("http://pokeapi.co/api/v1/pokemon/#{x}/")
parsed_data_one = JSON.parse(data)
pokemon_one = parsed_data_one["name"]
puts "Your pokemon is #{pokemon_one}!"

#Get Pokemon for Player 2
puts "Trainer #{name_two}, please enter the Pokedex number of your pokemon(1-101): "
x = gets.strip
puts "Great choice! Fetching your Pokeball now..."
data = RestClient.get("http://pokeapi.co/api/v1/pokemon/#{x}/")
parsed_data_two = JSON.parse(data)
pokemon_two = parsed_data_two["name"]
puts "Your pokemon is #{pokemon_two}!"

#TODO: Find a way to let each player pick a random move
#- Let each player know how many moves are available, and have him pick a number within that range
puts "Trainer #{name_one}, choose your move! #{pokemon_one} has #{parsed_data_one["moves"].size} 
	moves. Which will you use?"
num_one = gets.strip.to_i	
move_one = parsed_data_one["moves"][num_one-1]["name"]
puts "Trainer #{name_one}: \"#{pokemon_one}, use #{move_one}!\""

		
#- Calculate each move's damage
#-->Be sure to add multipliers based on Pokemon type (water x2 against fire, e.g.)
#- Subtract damage from Pokemon's hp 
#- Print out remaining HP for affected pokemon; continue with player 2's turn
#- Continue until one Pokemon has 0 HP