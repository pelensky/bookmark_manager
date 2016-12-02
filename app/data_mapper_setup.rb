require "data_mapper"
require "dm-postgres-adapter"

require './app/models/link'
require './app/models/tagged_value'
require './app/models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
