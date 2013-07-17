patch app/AppKernel.php Kernel.patch
patch app/config/config.yml config.patch
patch app/config/config_dev.yml config_dev.patch
php app/console assets:install web --symlink
php app/console generate:bundle --no-interaction --namespace="HmiraVendor/HmiraBundle" --bundle-name="HmiraVendorHmiraBundle" --format="yml" --dir="src/" -vvv
php app/console doctrine:mapping:convert xml ./src/HmiraVendor/HmiraBundle/Resources/config/doctrine --from-database --force
sh add_prefix_to_entities.sh
php app/console doctrine:mapping:convert annotation ./src
php app/console doctrine:generate:entities HmiraVendorHmiraBundle

#create loop

#php app/console admin:generate-admin --namespace="HmiraVendor/HmiraBundle" --dir="./src" --bundle-name="HmiraVendorHmiraBundle" --prefix="Skuska" --model-name="Skuska" -n

patch vendor/cedriclombardot/admingenerator-generator-bundle/Admingenerator/GeneratorBundle/Menu/DefaultMenuBuilder.php menu.patch


sh generate_entities_list.sh
