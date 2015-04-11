require 'spec_helper'

describe 'users::vuser', :type => :define do
  context 'testing without sshkey' do
    let(:title) { 'lgbarn' }
    let(:params) { { 'uid' => '5000', 'gid' => '5000', 'realname' => 'Luther Barnum' } }

    it { should contain_users__vuser('lgbarn') }
    it { should contain_user('lgbarn') }
    it { should_not contain_ssh_authorized_key('lgbarn') }
  end
  context 'testing with sshkey' do
    let(:title) { 'lgbarn' }
    let(:params) { { 'uid' => '5000', 'gid' => '5000', 'realname' => 'Luther Barnum', 'sshkey' => 'AAAAB3NzaC1yczZtbZG4w==' } }

    it { should contain_users__vuser('lgbarn') }
    it { should contain_user('lgbarn') }
    it { should contain_ssh_authorized_key('lgbarn') }
  end

end
