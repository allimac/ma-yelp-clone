# require 'rails_helper'
require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many(:reviews).dependent(:destroy)  }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews'  do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end
    context 'one review' do
      it 'returns the review rating' do
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 5)
        expect(restaurant.average_rating).to eq 5
      end
    end
    context 'one review' do
      it 'returns the review rating' do
        User.create(email: 'test@test.com', password: '12345678', id: 1000)
        User.create(email: 'test2@test.com', password: '12345678', id: 2000)
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 5, user_id: 1000)
        restaurant.reviews.create(rating: 3, user_id: 2000)
        expect(restaurant.average_rating).to eq 4
      end
    end
  end

end
