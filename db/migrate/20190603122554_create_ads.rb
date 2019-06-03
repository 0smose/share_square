class CreateAds < ActiveRecord::Migration[5.2]
	def change
		create_table :ads do |t|
			t.string :title
			t.text :description
			t.string :duration
			t.string :frequency
			t.boolean :other_propositions
			t.string :availability
			t.belongs_to :user, index: true
			t.belongs_to :type, index: true
			t.belongs_to :category, index: true

			t.timestamps
		end
	end
end
