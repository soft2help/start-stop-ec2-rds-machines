# START STOP EC2 AND RDS AWS MACHINES

In the file .env you should configure your parameters. This file should stay in .gitignore file

EC2   
RDS

In first place you should configure a AWS IAM and add a user with right permissions to allow start and stop machines.

Change the json policies bellow with your configurations. If you dont know how create a IAM USER you can view a similar example here
<https://www.iguazio.com/docs/latest-release/cluster-mgmt/deployment/cloud/aws/howto/iam-user-create/>

Ec2Machine
```json
{
    "Version": "2012-10-17",
    "Statement": [
                    {
                        "Sid": "VisualEditor0",
                        "Effect": "Allow",
                        "Action": [
                                    "ec2:StartInstances",
                                    "ec2:StopInstances"
                                ],
                        "Resource": "arn:aws:ec2:*:*:instance/{CHANGE_IT_TO_EC2_INSTANCE_ID}"
                    },
                    {
                        "Sid": "VisualEditor1",
                        "Effect": "Allow",
                        "Action": "ec2:DescribeInstances",
                        "Resource": "*"
                    }
                ]
}
```

RdsMachine

```json
{
    "Version": "2012-10-17",  
    "Statement": [  
                    {
                        "Sid": "VisualEditor0",
                        "Effect": "Allow",
                        "Action": [
                                    "rds:StopDBInstance",
                                    "rds:StartDBInstance"
                                ],
                        "Resource": "arn:aws:rds:_:_:db:{CHANGE_IT_TO_RDS_INSTANCE_ID}"
                    }
                ]
}
```
Change {CHANGE_IT_TO_EC2_INSTANCE_ID} to i-0e12312312311212 fro example (dont include braces)

This scripts use a docker machine with aws-cli to compile it you shoud put:
```
docker build -t aws-cli .
```

