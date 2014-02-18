class winmerge {
  package { "winmerge":
    ensure   => installed,
    provider => chocolatey
  }
}
