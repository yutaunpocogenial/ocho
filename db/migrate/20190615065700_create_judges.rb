class CreateJudges < ActiveRecord::Migration[5.2]
  def change
    create_table :judges do |t|
      t.bigint :opinion_id
      t.bigint :good
      t.bigint :bad

      t.timestamps
    end
  end
end
