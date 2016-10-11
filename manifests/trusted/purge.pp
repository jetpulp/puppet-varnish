# define: varnish::trusted::purge
define varnish::trusted::purge (
  $ip = $name,
) {
  include varnish
  concat::fragment { "varnish-trusted-purge-${ip}":
      order   => '12',
      content => "  \"${ip}\";\n",
      notify  => $varnish::manage_service_autorestart,
      target  => $varnish::vcl_conf,
  }
}

