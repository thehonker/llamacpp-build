// docker-bake.hcl
group "default" {
    targets = ["full", "frontend", "backend"]
}

target "docker-metadata-action" {}

target "build" {
  inherits = ["docker-metadata-action"]
  context = "./src/"
  platforms = [
    "linux/amd64"
  ]
  secret = [
    "type=env,id=GITHUB_TOKEN"
  ]
  target = "full"
}
