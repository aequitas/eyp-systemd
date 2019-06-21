require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'systemd timer type' do
  context 'target' do
    it "cleanup" do
      expect(shell("pkill sleep; echo").exit_code).to be_zero
    end

    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'systemd': }

      systemd_file::target { 'demotarget':
        description => 'demo target acceptance',
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file("/etc/systemd/system/demotarget.target") do
      it { should be_file }
      its(:content) { should match 'demo target acceptance' }
    end

  end
end
