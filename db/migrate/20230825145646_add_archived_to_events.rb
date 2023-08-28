class AddArchivedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :archived, :boolean
  end
end
