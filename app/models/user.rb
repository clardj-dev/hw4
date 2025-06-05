class User < ApplicationRecord
  has_secure_password

  # A User "has many" Places. Deleting a user destroys their places.
  has_many("places", "dependent" => :destroy)

  validates("username", "presence" => true)
  validates("email",    "presence" => true, "uniqueness" => true)
end
