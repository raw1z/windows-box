class 7zip {
  package { "7zip.commandline":
    ensure => installed,
	provider => chocolatey
  }
}