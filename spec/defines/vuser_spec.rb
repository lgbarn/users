require 'spec_helper'

describe 'users::vuser', :type => :define do
  let(:title) { 'lgbarn' }

#  it { should contain_users__vuser('lgbarn') }
  at_exit { RSpec::Puppet::Coverage.report! }
end

