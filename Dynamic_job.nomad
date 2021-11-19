job "http-echo"{
  datacenters=["dc1"]
  group "echo"{
    count = 5
    task "server"{
      driver = "docker"
      config {
        image = "hashicorp/http-echo:latest"
        args = [
        "-listen",":${NOMAD_PORT_http}",
        "-text","hello welcome to 127.0.0.1 running on port 8080",     
        ]
      }
      resources{
        network{
          mbits = 10
          port "http"{ 
          }
        }
      }
    }
  }
}

