require 'rails_helper'

RSpec.describe Laboratory, type: :model do
  it {is_expected.to have_many :projects}
  it {is_expected.to belong_to :institute}
  it {is_expected.to validate_presence_of :name_fr}
  it {is_expected.to validate_uniqueness_of :name_fr}
end
