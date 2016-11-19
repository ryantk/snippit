require 'spec_helper'

describe Repository do

  it 'stores and returns the repository for the given name' do
    test_repository = double
    described_class.register(:test, test_repository)

    expect(described_class.for(:test)).to eq(test_repository)
  end

end