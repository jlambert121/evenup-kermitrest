require 'spec_helper'

describe 'kermitrest', :type => :class do

  it { should create_class('kermitrest') }
  it { should contain_package('kermit-restmco').with_ensure('latest') }
  ['sinatra', 'inifile', 'thin'].each do |package|
    it { should contain_package(package).with_provider('gem') }
  end
  it { should contain_file('/var/log/kermit-restmco.log') }
  it { should contain_file('/etc/kermit/kermit-restmco.cfg') }
  it { should contain_service('kermit-restmco').with_ensure('running').with_enable(true) }

  context 'set version' do
    let(:params) { { :version => 'present' } }
    it { should contain_package('kermit-restmco').with_ensure('present') }
  end

  context 'disable service' do
    let(:params) { { :service_ensure => 'stopped', :service_enable => false } }
    it { should contain_service('kermit-restmco').with_ensure('stopped').with_enable(false) }
  end

  context 'install kermit repos' do
    let(:params) { { :install_repo => true } }
    context 'valid osfamily' do
      let(:facts) { { :osfamily => 'RedHat' } }
      it { should contain_yumrepo('kermit-custom') }
      it { should contain_yumrepo('kermit-thirdpart') }
    end
    context 'invalid osfamily' do
      let(:facts) { { :osfamily => 'IDontExist' } }
      it { expect { should raise_error(Puppet::Error) } }
    end
  end

  context 'gem package support' do
    let(:params) { { :gem_provider => 'rpm', :gem_prefix => 'rubygem-' } }
    ['rubygem-sinatra', 'rubygem-inifile', 'rubygem-thin'].each do |package|
      it { should contain_package(package).with_provider('rpm') }
    end
  end

end
