![image](https://github.com/lucasko-tw/terraform-aws/blob/master/04-ec2-ebs/image-1.png)


![image](https://github.com/lucasko-tw/terraform-aws/blob/master/04-ec2-ebs/image-2.png)


## Volume

```
resource "aws_volume_attachment" "my_ebs_att" {
 
 ... 
 
}

resource "aws_instance" "my_ec2" {
  
  ... 
  
  root_block_device {

  ...
  
  }  
  
  ebs_block_device {

  ...
  
  }

```

1. The **root\_block\_device** is the EBS volume provided by the AMI that will contain the operating system. If you don't configure it, AWS will use the default values from the AMI.

2. The **ebs\_block\_device** entries to mount additional volumes on the instance, besides the root volume. 

3. **aws_volume_attachment**

	* what's the difference between attach and mount in ebs for amazon ec2
		* Attaching a volume simply attaches the volume as a block device to the instance. This action only allows the device to be visible within the operating system. To use it, you will need to format it, and mount it to the file system. 

4. Volumes can only be mounted by one instance at any time.
5. Instances can only attach EBS Volumes that are in the same Availability Zone.
6. Multiple EBS Volumes can be attached to the same instance.
7. Create an EBS Snapshot of an EBS Volume at any point in time.