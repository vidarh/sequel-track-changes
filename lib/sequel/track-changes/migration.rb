
migration 'create the journal table' do
  database.create_table :journals do
    primary_key :id
    timestamp   :created_at, :null => false
    timestamp   :modified_at, :null => false
    text        :subject
    text        :contents

    index :created_at
  end
end
