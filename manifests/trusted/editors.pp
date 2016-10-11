# define: varnish::trusted::editors
define varnish::trusted::editors (
  $ip = $name,
) {
  include varnish
  concat::fragment { "varnish-trusted-editors-${ip}":
      order   => '15',
      content => "  \"${ip}\";\n",
      notify  => $varnish::manage_service_autorestart,
      target  => $varnish::vcl_conf,
  }
}

