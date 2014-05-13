require 'spec_helper'

describe 'et_base::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  # TODO: Add some actual tests
  # it 'sets up a base platform' do
  #   # Nothing yet
  # end
end
