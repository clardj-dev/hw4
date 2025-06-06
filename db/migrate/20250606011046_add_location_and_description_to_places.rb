class AddLocationAndDescriptionToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, "location", :string
    add_column :places, "description", :text
  end
end
