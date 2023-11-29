class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :otp_secret_key
      t.boolean :otp_enabled, default: false

      t.timestamps
    end
  end
end
