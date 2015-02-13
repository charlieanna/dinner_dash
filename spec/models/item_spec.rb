require 'rails_helper'

describe Item do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:categories) }
  it { should have_and_belong_to_many(:categories) }

  it { should have_db_index(:title) }
  it { should have_attached_file(:photo) }
  # it { should validate_attachment_presence(:photo) }
  it do
    should validate_numericality_of(:price)
      .is_greater_than(0)
  end
  it 'title should not be an empty string' do
    item = Item.new(title: '', description: 'description', price: 10)
    expect(item).not_to be_valid
  end

  it 'description should not be an empty string' do
    item = Item.new(title: 'title', description: '', price: 10)
    expect(item).not_to be_valid
  end
end
