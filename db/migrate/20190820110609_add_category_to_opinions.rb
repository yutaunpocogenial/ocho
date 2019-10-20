class AddCategoryToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :category, :string
  end
end
