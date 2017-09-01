if date -v-30d > /dev/null 2>&1; then
    # GNU systems (Linux)
   DATE=date --date="-30 days" +%Y-%m-%d
fi
aws ec2 describe-volumes --query 'Volumes[*].[VolumeId, Attachments[0].InstanceId,CreateTime]' --filters Name=status,Values=available --output table
