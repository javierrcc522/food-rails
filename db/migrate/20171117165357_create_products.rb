class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :cost, :integer
      t.column :country_origin, :string 


      t.timestamps
    end
  end
end
