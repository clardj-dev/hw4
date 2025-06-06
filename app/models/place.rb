class Place < ApplicationRecord
  # Each Place belongs to a User:
  belongs_to :user

  # Each Place has many Entries; destroying a Place destroys its entries:
  has_many :entries, :dependent => :destroy

  # Validations using quoted keys:
  validates("name",     "presence" => true)
  validates("location", "presence" => true)
end
