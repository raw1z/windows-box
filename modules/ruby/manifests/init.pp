class ruby {
  package { "ruby.devkit":
    ensure   => installed,
    provider => chocolatey
  }
}
