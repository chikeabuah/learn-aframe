class CreateAframes < ActiveRecord::Migration[5.1]
  def change
    create_table :aframes do |t|
      t.text :jscode
      t.text :htmlcode

      t.timestamps
    end
  end
end
