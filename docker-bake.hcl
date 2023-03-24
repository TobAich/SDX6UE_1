group "default" {
    targets = ["recipe"]
}

target "recipe" {
    dockerfile = "Dockerfile"
    tags = ["recipe_net:latest"]
    platforms = ["linux/amd64", "linux/arm64"]
}

