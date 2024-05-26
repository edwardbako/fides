class CreateAppeals < ActiveRecord::Migration[7.1]
  def change
    create_table :appeals do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
