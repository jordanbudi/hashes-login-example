require 'io/console'

@all_users = {:admin => {:password => "password", :name => "admin", :email => "admin@admin.com", :birthday =>"01/01/0001"}}
@authorize = false

def new_account
  puts "Enter username"
  username = gets.chomp
  puts "Enter password"
  password = STDIN.noecho(&:gets).chomp
  puts "Enter full name"
  name = gets.chomp
  puts "Enter email"
  email = gets.chomp
  puts "Enter Birthday mm/dd/yyyy"
  birthday = gets.chomp

  @all_users[username.to_sym]={
                              :password => password,
                              :name => name,
                              :email => email,
                              :birthday => birthday
                              }
end

def login
  puts "Enter username"
  username = gets.chomp
  puts "Enter password"
  password = gets.chomp
  if @all_users[username.to_sym][:password] == password
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
