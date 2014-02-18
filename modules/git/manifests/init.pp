class git {
  exec { "configure-proxy":
    command => 'cmd /C "git config --global http.proxy %HTTP_PROXY%"'
  }
}