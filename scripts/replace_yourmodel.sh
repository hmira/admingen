sed -i "s/YourModel\.title/${1}.id/g" src/HmiraVendor/HmiraBundle/Resources/config/$1-generator.yml
sed -i "s/for HmiraBundle/for ${1}/g" src/HmiraVendor/HmiraBundle/Resources/config/$1-generator.yml
