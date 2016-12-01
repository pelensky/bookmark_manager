require "data_mapper"
require "dm-postgres-adapter"
require_relative "tag"

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String
  property :title, String
  has n, :tagged_value, :through => Resource
end

DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
