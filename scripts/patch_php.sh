if [ $# -eq 1 ]; then
:
else
	echo "provide a file to patch"
	exit 1;
fi

if ls src/HmiraVendor/HmiraBundle/Entity/${1}.php; then
:
else
	echo "file does not exist"
	exit 1;
fi

if fgrep "setId" src/HmiraVendor/HmiraBundle/Entity/${1}.php; then

echo "$#"
echo "the method setId() is already contained"

else

cat src/HmiraVendor/HmiraBundle/Entity/${1}.php | head -n -1 > src/HmiraVendor/HmiraBundle/Entity/.${1}.php.main
cp src/HmiraVendor/HmiraBundle/Entity/${1}.php src/HmiraVendor/HmiraBundle/Entity/.${1}.php.tail

awk 'END {
	printf "####### GENERATED FUNCTION #######\n";
	printf "\n";
	printf "\tpublic function setId($id)\n"
	printf "\t{\n";
	printf "\t\t$this->id = $id;\n";
	printf "\t\treturn $this;\n";
	printf "\t}\n";
	printf "\n";
	printf "####### !GENERATED FUNCTION #######\n";
	print $1
	}' src/HmiraVendor/HmiraBundle/Entity/.${1}.php.tail >  src/HmiraVendor/HmiraBundle/Entity/.${1}.php.tail~ && mv src/HmiraVendor/HmiraBundle/Entity/.${1}.php.tail~ src/HmiraVendor/HmiraBundle/Entity/.${1}.php.tail

cat src/HmiraVendor/HmiraBundle/Entity/.${1}.php.main > src/HmiraVendor/HmiraBundle/Entity/${1}.php
cat src/HmiraVendor/HmiraBundle/Entity/.${1}.php.tail >> src/HmiraVendor/HmiraBundle/Entity/${1}.php

echo "the file src/HmiraVendor/HmiraBundle/Entity/${1}.php patched"

fi
