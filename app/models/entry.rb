class Entry < ApplicationRecord
  # Each Entry belongs to a Place:
  belongs_to :place
  belongs_to :user

  # Attach one image to each Entry (ActiveStorage):
  has_one_attached :uploaded_image

  # Validations using quoted keys:
  validates("title",      "presence" => true)
  validates("occurred_on", "presence" => true)
end
