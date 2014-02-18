class inkscape {
  package { "InkScape":
    ensure   => installed,
    provider => chocolatey
  }
}

