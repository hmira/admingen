find src/HmiraVendor/HmiraBundle/Resources/config/doctrine/*.xml | sed 's/.*\/\([a-Z]*\)\.orm.xml$/\1/g' > entities.txt;

while read line
do
echo $line
sh admingen.ins.sh $line
sh patch_php.sh $line
sh replace_yourmodel.sh $line
sh patch_generators.sh $line
sh update_menu.sh $line
done < entities.txt

php app/console assets:install web/
