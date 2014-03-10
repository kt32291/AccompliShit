class AddStuffToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :description, :text
    add_column :badges, :img, :string
  end
end
