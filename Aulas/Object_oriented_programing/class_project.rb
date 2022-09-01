# frozen_string_literal: true

class Computer
  @@users = {}
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def self.get_user
    @@users
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "Hello #{@username}. The file #{filename} has been created at #{time}"
  end
end

my_computer = Computer.new('Vitor', 12_345)
my_computer2 = Computer.new('Mayara', 12_345)
my_computer.create('computer_file.rb')
my_computer2.create('texto.txt')
puts Computer.get_user.to_s

# Second Project ________________________

class Account
  attr_reader :name, :balance

  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    'Access denied: incorrect PIN.'
  end

  public

  def display_balance(pin_number)
    if pin_number == @pin
      puts "Balance $#{@balance}"
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, ammount)
    if pin_number == @pin && ammount <= @balance
      @balance -= ammount
      puts "Withdrew #{ammount}. New balance: $#{@balance}"
    elsif pin_number != @pin
      puts pin_error
    else
      puts "Not enough money, bro! Current balance: #{@balance}"
    end
  end

  def deposit(pin_number, ammount)
    if pin_number == @pin
      @balance += ammount
      puts "Deposited #{ammount}. New balance: $#{@balance}"
    else
      puts pin_error
    end
  end
end

checking_account = Account.new('Vitor', 100_000_000)
