class CreateEventTable < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.string :title
    	t.text :body
    	t.integer :start
    	t.integer :end
    	t.integer :urgency
    	t.string :location
    	t.integer :day
    	t.integer :user_id
    end
  end
end
