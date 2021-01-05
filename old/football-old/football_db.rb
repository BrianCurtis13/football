require 'sqlite3'
require 'sequel'

def get_user_name
	puts "What is your name?"
	user_name = gets.chomp
	@user_name = user_name
end

def create_db
	db_file = "#{@user_name}.db"
	@db = Sequel.sqlite(db_file)
end

def say_goodbye
	puts "Ok, #{@user_name}. Your database is called #{@user_name}.db. Are you ready for some FOOTBALL?"
end

def create_players_table
	create_table?(:players) do
	  primary_key :id
	  String :first_name
	  String :last_name
	  Integer :weight
	  Integer :height
	  Integer :speed
	  Integer :quickness
	  Integer :accuracy
	  Integer :awareness
	  Integer :overall
	  Integer :strength
	  Integer :power
	end
end

get_user_name
create_db
say_goodbye