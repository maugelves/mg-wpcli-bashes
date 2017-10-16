# Variables
SITE=$1
DATABASENAME=$1"db"

# Create a local Database for the development
mysql -uroot -proot -e "CREATE DATABASE $DATABASENAME /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo "Database successfully created!"
echo "Granting ALL privileges on $DATABASENAME to root user"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON $DATABASENAME.* TO 'root'@'localhost';"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"

# Download the latest WordPress version in Spanish and overwrite in case of files in the same directory
echo "Downloading the latest version of WordPress"
wp core download --locale=es_ES --version=latest --force

# Create a wp-config file with the data
echo "Creating a wp-config.php file"
wp config create --dbname=$DATABASENAME --dbuser=root --dbpass=root --force

#Install the downloaded WordPress
echo "Installing WordPress :)"
wp core install --admin_user=admin --admin_password=admin --admin_email=your@email.com --skip-email --url=$SITE.dev --title=$SITE
#!/bin/bash

exit
