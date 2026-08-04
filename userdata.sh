#!/bin/bash

dnf update -y
dnf install -y nginx

systemctl enable nginx
systemctl start nginx

cat <<'HTML' > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>AWS Infrastructure Task</title>
</head>
<body>
  <h1>AWS Infrastructure Deployment Successful</h1>
  <p>Application hosted on Amazon EC2.</p>
</body>
</html>
HTML