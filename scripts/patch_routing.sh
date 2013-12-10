awk -v model=$1 '/hmira_vendor_hmira:/ {

        print "hmira_vendor_hmira:";
        print "    type: admingenerator";
	next
} /    resource:\ \"\@HmiraVendorHmiraBundle\/Resources\/config\/routing\.yml\"/ {

	print "    resource: \"@HmiraVendorHmiraBundle/Controller/" model "/\""
	next

}{
	print $0
}' app/config/routing.yml > app/config/routing.yml~ && mv app/config/routing.yml~ app/config/routing.yml
