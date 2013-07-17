awk -v model=$1 '/                list: ~/ {

	printf "                list:\n";
	printf "                   route: HmiraVendor_HmiraBundle_" model "_list\n";

} !/                list: ~/ {

	print $0;

}' src/HmiraVendor/HmiraBundle/Resources/config/${1}-generator.yml > src/HmiraVendor/HmiraBundle/Resources/config/${1}-generator.yml~ && mv src/HmiraVendor/HmiraBundle/Resources/config/${1}-generator.yml~ src/HmiraVendor/HmiraBundle/Resources/config/${1}-generator.yml
