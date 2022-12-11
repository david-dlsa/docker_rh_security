class AddBirthStateToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :birth_state, :string
  end
end
