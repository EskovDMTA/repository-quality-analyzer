class CreateRepositoryChecks < ActiveRecord::Migration[7.1]
  def change
    create_table :repository_checks do |t|
      t.references :repository, null: false, foreign_key: true
      t.string :status, default: false
      t.string :aasm_state
      t.string :commit_id
      t.string :repo_path
      t.json :check_result
      t.timestamps
    end
  end
end
