class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :message

      t.references :feedback

      t.timestamps
    end
  end
end
