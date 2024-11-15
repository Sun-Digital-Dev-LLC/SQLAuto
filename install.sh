#/bin/bash

# Prompt for MySQL root password
echo "Enter MySQL root password:"
read -s MYSQL_ROOT_PASSWORD

# Prompt for new database details
echo "Enter Client Number:"
read DB_NAME
# Store the client database name
DB_CLIENT="Client${DB_NAME}"

# Execute MySQL commands
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" << EOF
CREATE DATABASE ${DB_CLIENT}Sql;
USE ${DB_CLIENT}Sql;
CREATE USER '${DB_CLIENT}admin'@'%' IDENTIFIED BY '${DB_CLIENT}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_CLIENT}admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
EOF

echo "MySQL setup completed successfully!"