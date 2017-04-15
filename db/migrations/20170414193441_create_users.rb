Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :login, String, unique: true
      column :github_id, String, size: 100, unique: true
      column :email, String, null: false, unique: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
