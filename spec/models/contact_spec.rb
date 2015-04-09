require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject {build :contact}
  it {is_expected.to validate_presence_of :name}
  it {is_expected.to validate_uniqueness_of :name}
  it {is_expected.to validate_presence_of :email}
  it {is_expected.to validate_uniqueness_of :email}
end