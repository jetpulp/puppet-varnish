# define: varnish::backend
define varnish::backend(
  $ip,
  $port,
  $backend_name = $name,
  $template = 'varnish/varnish4-backend.vcl.erb',
) {
  include varnish
  concat::fragment { "varnish-backend-${name}":
      order   => '05',
      content => template($template),
      notify  => $varnish::manage_service_autorestart,
      target  => $varnish::vcl_conf,
  }
  concat::fragment { "varnish-backend-director-${name}":
      order   => '25',
      content => "vdir.add_backend(${backend_name});",
      notify  => $varnish::manage_service_autorestart,
      target  => $varnish::vcl_conf,
  }

}

