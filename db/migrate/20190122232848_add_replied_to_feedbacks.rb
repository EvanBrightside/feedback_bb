class AddRepliedToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :replied, :boolean, default: false
  end
end
