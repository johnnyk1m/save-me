class CreateDestins < ActiveRecord::Migration[5.2]
  def change
    create_table :destins do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.date :alarm_date
      t.text :address
      t.string :coords
      t.text :voice_msg
      t.references :user

      t.timestamps
    end
  end
end
