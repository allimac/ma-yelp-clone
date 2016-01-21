require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe ReviewsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

def leave_review(restaurant_name: 'KFC', thoughts: 'so so', rating: '3')
  click_link "Review #{restaurant_name}"
  fill_in "Thoughts", with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
