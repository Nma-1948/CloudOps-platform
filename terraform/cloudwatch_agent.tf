resource "aws_ssm_parameter" "cloudwatch_agent_config" {
  name  = "/${var.project_name}/${var.environment}/cloudwatch-agent/config"
  type  = "String"

  value = jsonencode({
    agent = {
      metrics_collection_interval = 60
      logfile                     = "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
    }

    metrics = {
      namespace = "${var.project_name}/${var.environment}"

      append_dimensions = {
        InstanceId = "$${aws:InstanceId}"
      }

      metrics_collected = {
        cpu = {
          measurement = [
            "cpu_usage_idle",
            "cpu_usage_user",
            "cpu_usage_system"
          ]

          total = true
        }

        mem = {
          measurement = [
            "mem_used_percent"
          ]
        }

        disk = {
          resources = ["*"]

          measurement = [
            "used_percent"
          ]
        }
      }
    }

    logs = {
      logs_collected = {
        files = {
          collect_list = [
            {
              file_path      = "/var/log/syslog"
              log_group_name = "${var.project_name}-${var.environment}-syslog"
              log_stream_name = "{instance_id}"
            },
            {
              file_path      = "/var/log/auth.log"
              log_group_name = "${var.project_name}-${var.environment}-auth"
              log_stream_name = "{instance_id}"
            }
          ]
        }
      }
    }
  })

  tags = local.common_tags
}
