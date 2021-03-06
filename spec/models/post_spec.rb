require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validaiton for post' do
    subject do
      lily = User.new(name: 'Henry Kc', photo: 'profile.png',
                      bio: 'I am coming out to be the best computer programmer', posts_counter: 0)
      Post.new(title: 'My best friend', text: 'Will soon be revealed',
               comments_counter: 3, likes_counter: 3, author_id: lily.id)
    end

    before { subject.save }

    it 'Should have title present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Should have title not being too long' do
      subject.title = 'one' * 200
      expect(subject).to_not be_valid
    end

    it 'Should have comments counter as an integer' do
      subject.comments_counter = 0.033
      expect(subject).to_not be_valid
    end

    it 'Should have comments counter not be less than zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should have likes counter not be less than zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Test for last recent posts' do
    subject { User.new(name: 'Lily Fr', photo: 'profile.png', bio: 'Lily the best', posts_counter: 0) }
    before { subject.save }
    it 'Should have maximum of five comments' do
      expect(subject.last_recent_posts).to eq(subject.last_recent_posts)
    end
  end
end
