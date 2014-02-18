class chrome {
  package { "GoogleChrome":
    ensure   => installed,
    provider => chocolatey
  }
}
