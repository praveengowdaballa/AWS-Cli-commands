#!/bin/bash

if date -v-30d > /dev/null 2>&1; then
    # BSD systems (Mac OS X)
    DATE=date -v-30d +%Y-%m-%d
else
    # GNU systems (Linux)
    DATE=date --date="-30 days" +%Y-%m-%d
fi

aws ec2 describe-instances --query "Reservations[].Instances[?LaunchTime>=\`$DATE\`][].{id: InstanceId, type: InstanceType, launched: LaunchTime}"
