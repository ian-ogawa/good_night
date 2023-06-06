class UserFollowerSerializer < ActiveModel::Serializer
  attributes :id, :follower_id, :following_id, :follow_status
  has_one :following, serializer: UserSerializer, id_method_name: :following_id
end
