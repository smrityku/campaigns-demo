class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.string :user_name
      t.string :email
      t.string :address
      t.decimal :amount_invested, default: 0.0
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
