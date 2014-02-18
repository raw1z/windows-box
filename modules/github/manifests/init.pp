class github {
  package { "Github":
    ensure   => installed,
    provider => chocolatey
  }
}
