class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :password_hash

  has_many :blogs
end
