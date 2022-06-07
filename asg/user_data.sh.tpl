#!/bin/bash
cd /var/www/html/

# cp wp-config-sample.php wp-config.php
# sed -i "s/database_name_here/${db_name}/g" wp-config.php
# sed -i "s/username_here/${db_user}/g" wp-config.php
# sed -i "s/password_here/${db_password}/g" wp-config.php
# sed -i "s/localhost/${db_host}/g" wp-config.php

# cat <<EOF >> /var/www/html/wp-config.php
# define('FS_METHOD', 'direct' );
# define('WP_MEMORY_LIMIT', '128M');
# EOF

export WORDPRESS_DB_NAME=${db_name}
export WORDPRESS_DB_HOST=${db_host}
export WORDPRESS_DB_USER=${db_user}
export WORDPRESS_DB_PASSWORD=${db_password}
export WORDPRESS_DB_PORT=${db_port}
export WORDPRESS_TABLE_PREFIX=wp_

chown -R apache:apache /var/www/html/
systemctl enable httpd
systemctl start httpd
