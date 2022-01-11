json.extract! lock_code, :id, :code, :invitation, :property_id, :smart_lock_id, :created_at, :updated_at
json.url lock_code_url(lock_code, format: :json)
