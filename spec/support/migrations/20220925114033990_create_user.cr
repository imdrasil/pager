class CreateUser < Jennifer::Migration::Base
  def up
    create_table(:users) do |t|
      t.string :name, {:null => false}
      t.integer :age
      t.bool :admin, {:null => false, :default => false}

      t.index :name, type: :unique, name: "name_index"
    end
  end

  def down
    drop_table(:users)
  end
end
