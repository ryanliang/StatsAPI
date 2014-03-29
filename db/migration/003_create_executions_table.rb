Sequel.migration do
  up do
    create_table(:executions) do
      primary_key :exec_id
      foreign_key :area_id, :areas
      Integer :year, null: false
      String :release, :null=>false
      String :raw_stats, :null=>false
      String :tc_agent, :null=>false
      String :env, :null=>false
      String :install, :null=>false
      String :os, :null=>false
      String :browser, :null=>false
      String :major_version, :null=>false
      String :minor_version, :null=>false
      String :comment, :null=>false
      Integer :total, :null=>false
      Integer :failed, :null=>false
      DateTime :created_on, :null=>false
      DateTime :updated_on, :null=>false
      String :report_date, :null=>false
    end
  end

  down do
    drop_table(:executions)
  end
end
