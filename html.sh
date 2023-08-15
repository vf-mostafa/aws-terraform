#!/bin/bash
yum install -y httpd 
systemctl start httpd
systemctl enable httpd
chmod 777 /var/www/html/
/bin/su -c "/usr/bin/aws s3 cp s3://my-s3-bucket.aws-terraform-practice-1/index.html /var/www/html/" - ec2-user
su - ec2-user
/usr/bin/aws s3 cp s3://my-s3-bucket.aws-terraform-practice-1/index.html /var/www/html/

