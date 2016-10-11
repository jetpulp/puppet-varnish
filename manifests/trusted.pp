# define: varnish::trusted
define varnish::trusted(
  $ip = $name,
) {
  include varnish
  concat::fragment { "varnish-trusted-${ip}":
      order   => '18',
      content => "  \"${ip}\";\n",
      notify  => $varnish::manage_service_autorestart,
      target  => $varnish::vcl_conf,
  }
}

