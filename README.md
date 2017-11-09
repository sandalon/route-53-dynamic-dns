# route-53-dynamic-dns
Docker container for dynamically updating Route 53 records.

Based on https://willwarren.com/2014/07/03/roll-dynamic-dns-service-using-amazon-route53/

Make sure the following environment variables are set:

1. AWS_ACCESS_KEY_ID
2. AWS_SECRET_ACCESS_KEY
3. AWS_DEFAULT_REGION
4. ZONE_ID
5. RECORDSET
