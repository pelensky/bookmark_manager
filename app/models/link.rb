require "data_mapper"
require "dm-postgres-adapter"

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String
  property :title, String
  has n, :tagged_value, :through => Resource
end
