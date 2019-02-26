class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :description
      t.text :address
      t.float :latitude
      t.float :longitude
      t.references :user
      t.timestamps
    end
  end
end
