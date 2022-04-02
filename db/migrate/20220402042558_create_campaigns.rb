class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.decimal :target_amount
      t.decimal :investment_multiple
      t.decimal :raised_amount
      t.string :sector
      t.string :country

      t.timestamps
    end
  end
end
