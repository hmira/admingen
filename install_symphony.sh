php composer.phar create-project symfony/framework-standard-edition $1 2.3.0;
cd $1
cp ../composer.phar .
#cp ../composer.json .
cp ../scripts/* .
php composer.phar update

sh extra_install.sh
