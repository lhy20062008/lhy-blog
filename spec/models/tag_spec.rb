require "rails_helper"

RSpec.describe Tag, :type => :model do
  it 'tag name should be different' do
    tag1 = Tag.create(name: 'tag')
    tag2 = Tag.create(name: 'tag')
    expect(tag2.errors.messages.keys.include?(:name)).to eq(true)
    expect(Tag.count).to eq(1)
  end  
end