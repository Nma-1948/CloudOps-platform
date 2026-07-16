data "cloudinit_config" "app" {

  gzip          = true
  base64_encode = true

  part {
    filename     = "cloud-init.yaml"
    content_type = "text/cloud-config"

    content = templatefile(
      "${path.module}/cloud-init/cloud-init.yaml",
      {
        docker_script = file("${path.module}/cloud-init/docker.sh")
      }
    )
  }
}
