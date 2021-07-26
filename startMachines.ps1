$conf = Get-Content '.env' | ConvertFrom-StringData

docker run --rm -ti  `
	-e "AWS_ACCESS_KEY_ID=$($conf.AWS_ACCESS_KEY_ID)" `
	-e "AWS_SECRET_ACCESS_KEY=$($conf.AWS_SECRET_ACCESS_KEY)" `
	-e "AWS_DEFAULT_REGION=$($conf.AWS_DEFAULT_REGION)" `
	aws-cli `
	"aws ec2 start-instances --instance-ids $($conf.EC_INSTANCE_ID)"

	docker run --rm -ti  `
	-e "AWS_ACCESS_KEY_ID=$($conf.AWS_ACCESS_KEY_ID)" `
	-e "AWS_SECRET_ACCESS_KEY=$($conf.AWS_SECRET_ACCESS_KEY)" `
	-e "AWS_DEFAULT_REGION=$($conf.AWS_DEFAULT_REGION)" `
	aws-cli `
	"aws rds start-db-instance --db-instance-identifier $($conf.RDS_INSTANCE_ID)"