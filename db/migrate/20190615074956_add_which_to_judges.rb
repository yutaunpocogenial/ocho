class AddWhichToJudges < ActiveRecord::Migration[5.2]
  def change
    add_column :judges, :which, :string
  end
end
