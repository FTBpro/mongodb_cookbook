actions :add

attribute :username, :kind_of => String, :name_attribute => true
attribute :password, :kind_of => String
attribute :roles, :kind_of => Array

def initialize(*args)
  super
  @action = :add
end
