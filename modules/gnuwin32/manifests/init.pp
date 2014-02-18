class gnuwin32 {
  package { 'GnuWin':
    ensure   => installed,
    provider => chocolatey
  }

  windows_path { 'add-to-path':
    ensure    => present,
    directory => 'c:\GnuWin\bin'
  }
}
