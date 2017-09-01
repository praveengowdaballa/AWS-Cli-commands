Note: this only considers security use in EC2, not other services like RDS. You'll need to do more work to include security groups used outside EC2. The good thing is you can't easily (might not even be possible) to delete active security groups if you miss one associated w/another service.
Using the newer AWS CLI tool, I found an easy way to get what I need:
First, get a list of all security groups
aws ec2 describe-security-groups --query 'SecurityGroups[*].GroupId' --output text | tr '\t' '\n'
Then get all security groups tied to an instance, then piped to sort then uniq:
aws ec2 describe-instances --query 'Reservations[*].Instances[*].SecurityGroups[*].GroupId' --output text | tr '\t' '\n' | sort | uniq
Then put it together and compare the 2 lists and see what's not being used from the master list:
comm -23 <(aws ec2 describe-security-groups --query 'SecurityGroups[*].GroupId' --output text | tr '\t' '\n'| sort) <(aws ec2 describe-instances --query 'Reservations[*].Instances[*].SecurityGroups[*].GroupId' --output text | tr '\t' '\n' | sort | uniq)
