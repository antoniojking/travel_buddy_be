class FriendshipSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :friend_id
end
