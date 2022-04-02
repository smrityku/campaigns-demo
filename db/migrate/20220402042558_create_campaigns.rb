class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.decimal :target_amount, default: 0.0
      t.decimal :investment_multiple, default: 0.0
      t.decimal :raised_amount, default: 0.0
      t.string :sector
      t.string :country

      t.timestamps
    end
  end
end
