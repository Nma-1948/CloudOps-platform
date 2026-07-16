#cloud-config

write_files:
  - path: /tmp/docker.sh
    owner: root:root
    permissions: "0755"
    content: | 
      ${indent(6, docker_script)}

runcmd:
  - echo "========== Cloud-init Started =========="

  - echo "========== Step 1: Install CloudWatch Agent =========="
  - wget -O /tmp/amazon-cloudwatch-agent.deb https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
  - dpkg -i /tmp/amazon-cloudwatch-agent.deb
  - /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:/amazon-cloudwatch-agent/config -s
  - echo "========== CloudWatch Agent Started =========="

  - echo "========== Step 2: Install Docker =========="
  - bash /tmp/docker.sh
  - echo "========== Docker Installation Completed =========="

final_message: "Cloud-init completed successfully."
