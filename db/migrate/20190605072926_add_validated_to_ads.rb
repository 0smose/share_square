class AddValidatedToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :validated, :boolean, default: nil
  end
end
