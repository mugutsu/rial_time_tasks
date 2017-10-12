class CreateAccessToProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :access_to_projects do |t|
      t.integer :user_id
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
