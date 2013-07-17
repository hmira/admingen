#php app/console admin:generate-admin --namespace="HmiraVendor/HmiraBundle" --model-name="$1" --prefix="$1" --no-interaction --dir="src"

php app/console admin:generate-admin --namespace="HmiraVendor/HmiraBundle" --dir="./src" --bundle-name="HmiraVendorHmiraBundle" --prefix="${1}" --model-name="${1}" -n
