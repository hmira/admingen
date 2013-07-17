awk -v model=$1 '/\s*return \$menu\s*/ {
        printf "####### GENERATED CODE #######\n";
        printf "\n";
	printf "\t$this->addLinkRoute($main, \"" model "\", \"HmiraVendor_HmiraBundle_" model "_list\");\n";
        printf "\n";
        printf "####### !GENERATED CODE #######\n";
        print $0;
        } !/\s*return \$menu\s*/ {
	print $0
	}' vendor/cedriclombardot/admingenerator-generator-bundle/Admingenerator/GeneratorBundle/Menu/DefaultMenuBuilder.php  >  vendor/cedriclombardot/admingenerator-generator-bundle/Admingenerator/GeneratorBundle/Menu/DefaultMenuBuilder.php~ && mv vendor/cedriclombardot/admingenerator-generator-bundle/Admingenerator/GeneratorBundle/Menu/DefaultMenuBuilder.php~ vendor/cedriclombardot/admingenerator-generator-bundle/Admingenerator/GeneratorBundle/Menu/DefaultMenuBuilder.php
