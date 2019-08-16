class AddVoteToJudges < ActiveRecord::Migration[5.2]
  def change
    add_column :judges, :vote, :bigint
  end
end
