resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "fastapi-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  alarm_description = "Alarm when EC2 CPU exceeds 80%"

  dimensions = {
    InstanceId = module.ec2.instance_id
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]
}
