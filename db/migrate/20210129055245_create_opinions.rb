class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.string :subject,        null: false
      t.text   :text,           null: false
      t.timestamps
    end
  end
end
