class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :description
      t.string :registration
      t.date :birth_date
      t.string :birth_county
      t.string :marital_status
      t.string :sex
      t.references :workspace, foreign_key: true
      t.references :job_role, foreign_key: true

      t.timestamps
    end
  end
end
