### To be copied in User data of EC2 Launch Instances Page ###

#!/bin/bash
dnf install nginx -y

cd /usr/share/nginx/html/
echo "<h1> Hello this is nginx server </h1>" > index.html

systemctl enable nginx # Skip this line to be unhealthy
systemctl start nginx