class CreateJobsites < ActiveRecord::Migration[6.1]
  def change
    create_table :jobsites do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
