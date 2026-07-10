resource "aws_ssm_parameter" "cloudwatch_config" {
  name  = "/amazon-cloudwatch-agent/config"
  type  = "String"

  value = jsonencode({
    metrics = {
      append_dimensions = {
        InstanceId = "$${aws:InstanceId}"
      }

      metrics_collected = {
        mem = {
          measurement = ["mem_used_percent"]
        }

        disk = {
          measurement = ["used_percent"]
          resources   = ["/"]
        }
      }
    }
  })
}
