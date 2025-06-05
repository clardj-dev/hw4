 class Entry < ApplicationRecord
+  # Each Entry must belong to a Place, so we can scope it later:
+  belongs_to("place")
+
+  # Enable attaching one image per entry (ActiveStorage):
+  has_one_attached("image")
+
+  # Basic validations so title and date aren’t blank:
+  validates("title",      "presence" => true)
+  validates("occurred_on", "presence" => true)
 end
