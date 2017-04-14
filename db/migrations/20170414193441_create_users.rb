Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :login, String
      column :github_id, String, size: 100
      column :email, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
