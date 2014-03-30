Sequel.migration do
  up do
    create_table(:areas) do
      primary_key :area_id
      String :name, :null=>false
      String :display_name, :null=>true
      String :size, :null=>true
      String :test_suite, :null=>false
    end
  end

  down do
    drop_table(:areas)
  end
end