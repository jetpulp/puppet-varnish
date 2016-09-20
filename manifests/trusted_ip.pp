# define: varnish::trusted_ip
define varnish::trusted_ip(
  $ip,
) {
  include varnish
  concat::fragment { "varnish-trusted-${ip}":
      order   => '15',
      content => "  \"${ip}\";\n",
      notify  => $varnish::manage_service_autorestart,
      target  => $varnish::vcl_conf,
  }
}

