# Ensure default FORWARD and INPUT chain policies are DROP.
describe iptables do
  it { should have_rule('-P INPUT DROP') }
end

describe iptables do
  it { should have_rule('-P FORWARD DROP') }
end

# Ensure default OUPUT chain policy is ACCEPT.
describe iptables do
  it { should have_rule('-P OUTPUT ACCEPT') }
end
