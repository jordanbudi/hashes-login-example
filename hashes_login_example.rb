@all_users = {:admin => "password"}
@authorize = false

def new_account
  puts "Enter username"
  username = gets.chomp
  puts "Enter password"
  password = gets.chomp
  @all_users[username.to_sym]=password
end

def login
  puts "Enter username"
  username = gets.chomp
  puts "Enter password"
  password = gets.chomp
  if @all_users[username.to_sym] == password
    puts "ACCESS GRANTED"
    @authorize = true
  else
    puts "INVALID CREDENTIALS"
  end
end

while @authorize == false
  puts "1. Log in"
  puts "2. Create New Account"
  option = gets.chomp

  case option
  when "1"
    login
  when "2"
    new_account
  when "-1"
    puts @all_users
  else
    puts "INVALID ENTRY"
  end
end
