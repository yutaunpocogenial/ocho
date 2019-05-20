class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.string :title
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
