class Category
  include DataMapper::Resource
#  include DataMapper::Reflection

  property :title, String

  has n, :blogs
end