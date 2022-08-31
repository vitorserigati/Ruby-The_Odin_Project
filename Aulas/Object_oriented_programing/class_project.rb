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
