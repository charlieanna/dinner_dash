require 'rails_helper'

describe Cart do
	it { should belong_to(:user) }
	it { should have_many(:line_items) }
end