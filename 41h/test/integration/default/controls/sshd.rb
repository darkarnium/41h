# Ensure the sshd configuration exists.
describe file('/etc/ssh/sshd_config') do
  it { should be_file }
  its('owner') { should eq 'root' }
  its('mode') { should cmp '0600' }
end

# Ensure sshd is installed, enabled and running.
describe service('sshd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# Ensure protocol is forced to v2.
describe sshd_config do
  its('Protocol') { should cmp 2 }
end

# Ensure root login is disabled.
describe sshd_config do
  its('PermitRootLogin') { should eq 'no' }
end

# Ensure PubKey Auth is enabled.
describe sshd_config do
  its('PubkeyAuthentication') { should eq 'yes' }
end

# Ensure password auth is disabled.
describe sshd_config do
  its('PasswordAuthentication') { should eq 'no' }
end
