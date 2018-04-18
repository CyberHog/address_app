class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :last_name, null: false, default: ""      # 名字
      t.string :first_name, null: false, default: ""     # 名前
      t.string :phone                                    # 電話番号

      t.timestamps
    end
  end
end
