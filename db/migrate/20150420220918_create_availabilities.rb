class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|

      t.integer     :activity_id
      t.datetime    :starts_at
      t.integer     :price
      t.string      :currency

      t.timestamps null: false
    end
  end
end
