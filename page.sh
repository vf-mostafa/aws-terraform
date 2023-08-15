#!/bin/bash
#set home page
echo "<html><h1>Hello from EC2 \$HOSTNAME</h1></html>" > /home/ec2-user/index.html

/bin/su -c "/usr/bin/aws s3 cp /home/ec2-user/index.html s3://my-s3-bucket.aws-terraform-practice-1/" - ec2-user
su - ec2-user
/usr/bin/aws s3 cp /home/ec2-user/index.html s3://my-s3-bucket.aws-terraform-practice-1/
