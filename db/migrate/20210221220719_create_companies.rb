class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location 
      t.integer :num_of_workers

      t.timestamps
    end
  end
end
