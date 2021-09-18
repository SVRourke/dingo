class CreateImageTags < ActiveRecord::Migration[6.1]
  def change
    create_table :images_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :image

      t.timestamps
    end
  end
end
