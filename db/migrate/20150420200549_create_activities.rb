class CreateActivities < ActiveRecord::Migration
  def change
    
    create_table :activities do |t|

        t.string   :title
        t.string   :description
        t.integer  :price
        t.string   :currency
        t.string   :city
        t.string   :country
        t.boolean  :is_active

        t.timestamps null: false
    end
  end
end
