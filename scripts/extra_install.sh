patch app/AppKernel.php Kernel.patch
patch app/config/config.yml config.patch
patch app/config/config_dev.yml config_dev.patch
php app/console assets:install web --symlink
php app/console generate:bundle --no-interaction --namespace="HmiraVendor/HmiraBundle" --bundle-name="HmiraVendorHmiraBundle" --format="yml" --dir="src/" -vvv
php app/console doctrine:mapping:convert xml ./src/HmiraVendor/HmiraBundle/Resources/config/doctrine --from-database --force
sh add_prefix_to_entities.sh
php app/console doctrine:mapping:convert annotation ./src
php app/console doctrine:generate:entities HmiraVendorHmiraBundle

patch vendor/cedriclombardot/admingenerator-generator-bundle/Admingenerator/GeneratorBundle/Menu/DefaultMenuBuilder.php menu.patch

sh generate_entities_list.sh

cp User.php src/HmiraVendor/HmiraBundle/Entity/
cp User.orm.xml src/HmiraVendor/HmiraBundle/Resources/config/doctrine/
php app/console doctrine:schema:update --force

cp security.yml app/config/security.yml
cat routing_tail.txt >> app/config/routing.yml


#setting the last model as default
eval LastModel=`cat entities.txt | awk -v model=$ent 'END {print $0; model = $0}'`
sh patch_routing.sh $LastModel


#setting permissions
sudo chown -R www-data app/logs
sudo chgrp -R www-data app/logs
sudo chmod -R 775 app/logs
sudo chown -R www-data app/cache
sudo chgrp -R www-data app/cache
sudo chmod -R 775 app/cache

