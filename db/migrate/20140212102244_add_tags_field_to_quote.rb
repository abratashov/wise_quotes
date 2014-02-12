class AddTagsFieldToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :tags_field, :string, null: false, default: ''
  end
end
