$conf = Get-Content '.env'| ConvertFrom-StringData

docker run --rm -it  `
	-e "AWS_ACCESS_KEY_ID=$($conf.AWS_ACCESS_KEY_ID)" `
	-e "AWS_SECRET_ACCESS_KEY=$($conf.AWS_SECRET_ACCESS_KEY)" `
	-e "AWS_DEFAULT_REGION=$($conf.AWS_DEFAULT_REGION)" `
	aws-cli `
	"aws ec2 stop-instances --instance-ids $($conf.EC_INSTANCE_ID)"

	docker run --rm -it  `
	-e "AWS_ACCESS_KEY_ID=$($conf.AWS_ACCESS_KEY_ID)" `
	-e "AWS_SECRET_ACCESS_KEY=$($conf.AWS_SECRET_ACCESS_KEY)" `
	-e "AWS_DEFAULT_REGION=$($conf.AWS_DEFAULT_REGION)" `
	aws-cli `
	"aws rds stop-db-instance --db-instance-identifier $($conf.RDS_INSTANCE_ID)"