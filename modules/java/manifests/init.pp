class java {
  package { "javaruntime":
    ensure   => installed,
    provider => chocolatey
  }
}
