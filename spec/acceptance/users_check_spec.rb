require 'spec_helper_acceptance'

describe 'users class' do
  describe 'apply users module' do
    it 'should apply with no errors' do
      pp = <<-EOS
      class { 'users': }
      @users::vuser {'lgbarn':
        uid => '5000',
        gid => 'users',
        realname => 'Luther Barnum',
      }
      @users::vuser {'barnuml':
        uid => '5001',
        gid => 'users',
        realname => 'Luther Barnum',
        sshkey => 'QWERTYUIOPASDFGHJKLZXCVBNM'
      }
      realize Users::Vuser['lgbarn']
      realize Users::Vuser['barnuml']
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
  
  describe 'users class' do
    describe user('lgbarn') do
      it { should exist }
      it { should have_uid '5000' }
      it { should belong_to_group 'users' }
    end
    describe user('barnuml') do
      it { should exist }
      it { should have_uid '5001' }
      it { should belong_to_group 'users' }
      it { should have_authorized_key 'QWERTYUIOPASDFGHJKLZXCVBNM' }
    end
  end
  
end
