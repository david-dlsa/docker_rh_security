class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :telephone
      t.string :cell_phone
      t.string :email

      t.timestamps
    end
  end
end
