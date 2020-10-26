class CreateJtPmRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :jt_pm_recipients do |t|
      t.references :recipient, index: true
      t.belongs_to :private_message, index: true
      t.timestamps
    end
  end
end
