class elasticsearch {
  package { "elastic":
    ensure   => installed,
    provider => chocolatey,
    require  => Class["java"]
  }
}
