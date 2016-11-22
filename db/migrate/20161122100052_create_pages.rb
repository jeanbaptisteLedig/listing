class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :content
      t.text :title
      t.text :language

      t.timestamps
    end
  end
end
