require 'rails_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should have_db_index(:email) }
  it { should have_secure_password }
end