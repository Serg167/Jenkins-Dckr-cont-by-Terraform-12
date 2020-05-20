# Create persistent Jenkins storage
resource "docker_volume" "jenkins_vol" {
  name = "jenkins_vol"
}

# Start the Jenkins Container with a Docker socket linked to host machine Docker swarm master's socket.
# This is done in order to get the host's Docker be able to run Dev Docker swarm
resource "docker_container" "jenkins_container" {
  name  = "jenkins"
  image = "jenkins:terraform12"
  ports {
    internal = "8080"
    external = "8080"
  }

  volumes {
    volume_name    = "jenkins_vol"
    container_path = "/var/jenkins_home"
  }

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
}
