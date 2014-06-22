require 'rest-client'
require 'json'

puts "Hello! Welcome to Pokemon Battle Arena!"

#TODO: Get names of 2 players

#TODO: Provide list of Pokemon and their Pokedex numbers?

#Address each player by their names
puts "Please enter the Pokedex number of your pokemon: "
x = gets.strip

puts "Great choice! Fetching your Pokeball now..."
data = RestClient.get("http://pokeapi.co/api/v1/pokemon/#{x}/")

parsed_data = JSON.parse(data)

name = parsed_data["name"]

puts "Your pokemon is #{name}!"

#Repeat for player 2

#TODO: Find a way to let each player pick a random move
#- Let each player know how many moves are available, and have him pick a number within that range
#- Calculate each move's damage
#-->Be sure to add multipliers based on Pokemon type (water x2 against fire, e.g.)
#- Subtract damage from Pokemon's hp 
#- Print out remaining HP for affected pokemon; continue with player 2's turn
#- Continue until one Pokemon has 0 HP