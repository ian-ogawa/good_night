class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clock_ins
end
