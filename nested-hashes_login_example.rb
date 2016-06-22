require 'io/console'

@all_users = {
              :admin => {:password => "password", :name => "admin", :email => "admin@admin.com", :birthday =>"01/01/0001"},
              :owlswipe => {:password => "secretpassword", :name => "Jordan", :email => "jordan@admin.com", :birthday =>"12/01/2000"}
              }
@authorize = false

def new_account
  puts "Enter username"
  username = gets.chomp
  puts "Enter password"
  password = STDIN.noecho(&:gets).chomp
  puts "[password hidden]"
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
  lookingforpassword = false
  puts "Enter username"
  username = gets.chomp
    if @all_users[:"#{username}"] != nil
      lookingforpassword = true
    end
  puts "Enter password"
  password = STDIN.noecho(&:gets).chomp
  puts "[password hidden]"
  if lookingforpassword == true
  if @all_users[username.to_sym][:password] == password
    puts "ACCESS GRANTED"
    sleep 1.5
    puts "Welcome, #{username}."
    sleep 1.4
    @authorize = true
  else
    puts "INVALID CREDENTIALS"
  end
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
