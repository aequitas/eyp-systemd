require 'spec_helper'

describe 'systemd_file::service' do
  let(:pre_condition) do
    "include '::systemd_file'"
  end
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let (:facts) {facts}
      let(:title) { 'foobar' }
      context 'with minimum parameters' do
        it { should compile.with_all_deps }
        it { should contain_file('/etc/systemd/system/foobar.service') }
      end
      context 'with execstart parameter' do
        let(:params) do
          {
            execstart: '/usr/bin/foobar'
          }
        end
        it { should compile.with_all_deps }
        it do
          should contain_file('/etc/systemd/system/foobar.service')
            .without_content(/^ExecStart=$/)
            .with_content(/^ExecStart=\/usr\/bin\/foobar$/)
        end
      end
    end
  end
end
