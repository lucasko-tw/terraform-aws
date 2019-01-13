# terraform-aws

### instance.tf

```sh
resource "aws_instance" "my_instance"
{

ami = "ami-09f0b8b3e41191524"
instance_type="t2.micro"


provisioner "local-exec" {
	// not running in AWS instance, but local operating system
    command = "echo ${aws_instance.my_instance.private_ip} >> private_ips.txt"
  }

}

output "ip" {
  value = "${aws_instance.my_instance.public_ip}"
}

```

### Output

```sh
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.my_instance: Creating...
  ami:                          "" => "ami-09f0b8b3e41191524"
  arn:                          "" => "<computed>"
  associate_public_ip_address:  "" => "<computed>"
  availability_zone:            "" => "<computed>"
  cpu_core_count:               "" => "<computed>"
  cpu_threads_per_core:         "" => "<computed>"
  ebs_block_device.#:           "" => "<computed>"
  ephemeral_block_device.#:     "" => "<computed>"
  get_password_data:            "" => "false"
  host_id:                      "" => "<computed>"
  instance_state:               "" => "<computed>"
  instance_type:                "" => "t2.micro"
  ipv6_address_count:           "" => "<computed>"
  ipv6_addresses.#:             "" => "<computed>"
  key_name:                     "" => "<computed>"
  network_interface.#:          "" => "<computed>"
  network_interface_id:         "" => "<computed>"
  password_data:                "" => "<computed>"
  placement_group:              "" => "<computed>"
  primary_network_interface_id: "" => "<computed>"
  private_dns:                  "" => "<computed>"
  private_ip:                   "" => "<computed>"
  public_dns:                   "" => "<computed>"
  public_ip:                    "" => "<computed>"
  root_block_device.#:          "" => "<computed>"
  security_groups.#:            "" => "<computed>"
  source_dest_check:            "" => "true"
  subnet_id:                    "" => "<computed>"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_instance.my_instance: Still creating... (10s elapsed)
aws_instance.my_instance: Still creating... (20s elapsed)
aws_instance.my_instance: Still creating... (30s elapsed)
aws_instance.my_instance: Provisioning with 'local-exec'...
aws_instance.my_instance (local-exec): Executing: ["/bin/sh" "-c" "echo 172.31.12.123 >> private_ips.txt"]
aws_instance.my_instance: Creation complete after 33s (ID: i-0c8f645a687fe0ddb)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

ip = 34.247.255.3

```

### Output file in Local Side (Not in AWS)

```sh
lucasko$ ls -l
total 64
-rw-r--r--@ 1 lucasko  staff  2654 13 Jan 21:03 README.md
-rw-r--r--@ 1 lucasko  staff   325 13 Jan 20:50 instance.tf
-rw-r--r--  1 lucasko  staff    14 13 Jan 20:52 private_ips.txt
-rw-r--r--  1 lucasko  staff   122 13 Jan 20:40 provider.tf
-rw-r--r--  1 lucasko  staff  5593 13 Jan 20:52 terraform.tfstate
-rw-r--r--  1 lucasko  staff   119 13 Jan 20:42 terraform.tfvars
-rw-r--r--  1 lucasko  staff   109 13 Jan 20:40 vars.tf

lucasko$ cat private_ips.txt 
172.31.12.123

```


### Show Output

```sh
terraform out
```
