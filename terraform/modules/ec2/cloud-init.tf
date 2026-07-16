data "cloudinit_config" "app" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "cloud-init.yaml"
    content_type = "text/cloud-config"

    content = templatefile(
      "${path.module}/cloud-init/cloud-init.yaml.tpl",
      {
        docker_script = indent(
          8,
          file("${path.module}/cloud-init/docker.sh")
        )
      }
    )
  }
}
