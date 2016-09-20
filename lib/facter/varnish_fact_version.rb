Facter.add(:varnish_fact_version) do
  setcode do

    varnish_cmd_result = Facter::Util::Resolution.exec('varnishd -V 2>&1 | head -n1 | cut -d - -f2 | awk \'{ print $1 }\'')

  end
end
