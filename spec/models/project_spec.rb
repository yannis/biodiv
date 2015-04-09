require 'rails_helper'

RSpec.describe Project, type: :model do
  subject {create :project}
  it {is_expected.to belong_to :laboratory}
  it {is_expected.to validate_presence_of :name_fr}
  it {is_expected.to validate_uniqueness_of(:name_fr).scoped_to(:laboratory_id)}
end
