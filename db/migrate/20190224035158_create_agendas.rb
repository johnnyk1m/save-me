class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :description
      t.text :address
      t.string :gps

      t.references :user
      t.timestamps
    end
  end
end
