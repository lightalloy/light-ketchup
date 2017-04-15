Hanami::Model.migration do
  change do
    create_table :time_entries do
      primary_key :id
      column :date, Date, null: false
      column :minutes, Integer, default: 0

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      foreign_key :user_id, :users, on_delete: :cascade, null: false
    end
  end
end
