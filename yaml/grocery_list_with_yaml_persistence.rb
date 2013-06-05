require 'yaml'

class Grocery_list
  attr_accessor :username
  def initialize
    @list = {}
    @bought = {}
  end
 
  def add(item)
    if @list.has_key?(item)
      @list[item] += 1
    else
      @list[item] = 1
    end
      @list.inspect
  end
 
  def buy(item)
    if @list.has_key?(item) && @list[item] > 1
      @list[item] -= 1
      @bought[item] = 1
    elsif 
      @list.delete(item)
      @bought[item] = 1
    else
      puts "This item was not in the list. Do you want to add it to bought items?"
      puts "Please answer y or n."
      answer = gets.chomp
      if answer.downcase == 'y'
        @bought[item] = 1
      end
    end
  end
 
  def list
    puts
    puts "GROCERY LIST"
    @list.each { |k,v| puts "#{k} (#{v})" }
    puts
    puts "BOUGHT"
    @bought.each { |k,v| puts "#{k} (#{v})" }
    puts
  end
 
  def save
    puts "What do you want to call the list?"
    filename = gets.chomp + ".txt"
    File.open filename, 'w' do |f|
      f.write "Here's your grocery list: #{@list}. \nHere's what you've bought: #{@bought}." 
    end
    puts "Your list has been saved as #{filename}."
  end
end

if File.exist?("my_grocery_list.yaml")
  list = nil
  File.open("my_grocery_list.yaml", "r") do |file|
    list = YAML::load(file)
    # puts serialized_list
  end
else
  list = Grocery_list.new
end


# Greet User 
# Get new User's name
if list.username
  puts "Welcome back #{list.username} to GroceryStore List"
  puts
else
  puts "What's your name? (ex. John Doe) ..."
  username = gets.chomp
  list.username = username
  puts "Nice to meet you #{username}"
  puts "Enjoy creating your list!"
  puts
end


# Main loop
while true
  puts "What do you want to do?\n add, buy, list, save, exit"
  puts 
  option = gets.chomp
  if option == "add"
    puts "What do you want to buy? Please enter an item."
    item = gets.chomp
    list.add(item)
  elsif option == "buy"
    puts "What did you buy? Please enter an item."
    item = gets.chomp
    list.buy(item)
  elsif option == "list"
    list.list
  elsif option == "save"
    list.save
  elsif option == "exit"
    break
  else
    puts "Huh? Please type in one of the options."
  end

end

# create yaml file in current directory before exiting
File.open("my_grocery_list.yaml", "w") do |file|
  file.puts YAML::dump(list)
end



