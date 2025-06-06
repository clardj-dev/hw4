class User < ApplicationRecord
  has_secure_password

  # A User has many Places; deleting a user destroys their places.
  has_many :places, :dependent => :destroy

  # Validations using quoted keys and hash rockets:
  validates("username", "presence" => true)
  validates("email",    "presence" => true, "uniqueness" => true)
end
