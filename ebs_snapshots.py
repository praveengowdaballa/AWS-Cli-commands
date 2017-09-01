#!/usr/bin/python

import boto

# praveen snpashot

ec2 = boto.connect_ec2('AKIAI2R6ABPA43HF7H2Q','tNVN0Da05SX2JUD3eX0ePDGkQ2uW4xbJpkGaYP6Y')
volumes = ec2.get_all_volumes()
for volume in volumes:
	ec2.create_snapshot(volume.id,"backup made with backup script")


# praveen snapshot
import boto
ec2 = boto.connect_ec2('AKIAI2R6ABPA43HF7H2Q','tNVN0Da05SX2JUD3eX0ePDGkQ2uW4xbJpkGaYP6Y')
volumes = ec2.get_all_volumes()
for volume in volumes:
	if snapshot.description=="backup made with backup script":
		snapshot.delete()





		#!/usr/bin/env python
