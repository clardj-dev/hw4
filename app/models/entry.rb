class Entry < ApplicationRecord
  # Each Entry belongs to a Place:
  belongs_to :place

  # Attach one image to each Entry (ActiveStorage):
  has_one_attached :image

  # Validations using quoted keys:
  validates("title",      "presence" => true)
  validates("occurred_on", "presence" => true)
end
