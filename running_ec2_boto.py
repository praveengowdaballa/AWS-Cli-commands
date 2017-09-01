import boto3
dummy=boto3.client('ec2')
reglist=dummy.describe_regions()
allregions=reglist['Regions']
#print allregions

emptyreg=[]

for eachreg in allregions:
    emptyreg.append(eachreg['RegionName'])

#print emptyreg

for reg in emptyreg:
    print "####RegionName="+reg
    dummy=boto3.client('ec2',region_name=reg)
    reservations = dummy.describe_instances().get('Reservations',[])
    instances = sum(
                    [
                      [i for i in r['Instances']]
                      for r in reservations
                      ], [])
    for ins in instances:
    #    print ("InstancesId="+ins['InstanceId']+" ImageId="+ins['ImageId']+"  InstanceState="+ins['State']['Name'])
        if ins['State']['Name']=="running":
            print("I am running, my InstanceId is"+ins['InstanceId'])




# for reg in reglist:
#     print reg['Regions']['Name']
# reservations = dummy.describe_instances().get('Reservations',[])
# instances = sum(
#                 [
#                   [i for i in r['Instances']]
#                   for r in reservations
#                   ], [])
# for ins in instances:
#
# #       print ("InstancesId="+ins['InstanceId']+" ImageId="+ins['ImageId']+"  InstanceState="+ins['State']['Name'])
#         if ins['State']['Name']=="running":
#                 print("I am running, my InstanceId is"+ins['InstanceId'])

