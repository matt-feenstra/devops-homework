job "homework_app" {

  datacenters = ["dc1"]
  type = "service"

  update {
    stagger      = "30s"
  }
  #######################
  group "server-1" {
    network {
      port "incoming_port" {
        static = 5000
      }
    }
    task "task_service_a" {
      driver = "docker"
  
      config {
        image = "dcr.feenstra.io:5000/app_a"
        ports = ["incoming_port"]
      }
      env {
        UID = "1234"
        USERNAME = "appuser"
        SHA256PASS = <<EOS
  $6$2xASsgW6bemivVDM$0AoGfagw2bPQ5iPD6bSitwQBSQ34Zf7Qz
  P0eEJvvnyZcucmBYoI5xQ/xpbIRJwmctdmPFD85q52MGWMk7EdNy1
  EOS
      }
      resources {
        cpu    = 500
        memory = 128
      }
    }
  }
  #######################
  group "server-2" {
    network {
      port "db_port" {
        static = 5001
      }
    }
    task "task_service_b" {
      driver = "docker"
      config {
        image = "dcr.feenstra.io:5000/app_b"
        ports = ["db_port"]
      }
      env {
        UID = "1234"
        USERNAME = "appuser"
        SHA256PASS = <<EOS
  $6$2xASsgW6bemivVDM$0AoGfagw2bPQ5iPD6bSitwQBSQ34Zf7Qz
  P0eEJvvnyZcucmBYoI5xQ/xpbIRJwmctdmPFD85q52MGWMk7EdNy1
  EOS
      }
      resources {
        cpu    = 500
        memory = 128
      }
    }
  }
}
