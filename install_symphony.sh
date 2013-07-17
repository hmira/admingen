wget http://getcomposer.org/composer.phar
php composer.phar create-project symfony/framework-standard-edition $1 2.3.0;
cd $1
cp ../composer.phar .
cp ../composer.json .
php composer.phar update
cp ../scripts/* .

sh extra_install.sh
