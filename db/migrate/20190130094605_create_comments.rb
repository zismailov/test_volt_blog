class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.references :post, null: false, index: true, foreign_key: true
      t.datetime :published_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
