require 'sqlite3'
require 'sequel'

class FootballDB
	RESOURCES = [:players, :teams]
	PLAYER_ATTRIBUTES = [:first_name, :last_name, :position, :number, :height, :weight]
	# RESOURCE_ATTRIBUTES = {
	# 	:players => [:first_name, :last_name, :position, :number, :height, :weight],
	# 	:teams => []
	# }

	def initialize(season)
		db_file = "./game_files_#{season}.db"
		@db = Sequel.sqlite(db_file)
		@resource_attributes = resource_attributes
		setup_database
		# binding.pry
		# create_db
	end

	def resource_attributes
		{
			:players => [:first_name, :last_name, :position, :number, :height, :weight, :rating],
			:teams => []
		}
	end

	def setup_database
		RESOURCES.each do |resource|
			attributes = @resource_attributes[resource]
			create_resource_table(resource, attributes) unless attributes == []
		end
	end

	def create_resource_table(resource, attributes)
		@db.create_table?(resource) do
			primary_key :id
			attributes.each { |attr| String attr }
		end
	end

	def show_all(resource)
		@db[resource].all
	end

	def add_player(info)
		add_resource(:players, info)
	end

	private

	def add_resource(table, info)
		@db[table].insert(info)
	end

end



