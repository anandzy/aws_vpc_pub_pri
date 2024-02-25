# AWS VPC Module

Create a Terraform module that provisions an Amazon Web Services Virtual Private Cloud (AWS VPC).

## Requirements

The module should have at least the following variable: `availability_zones`, a set of strings.

The VPC should contain one public subnet and one private subnet in each
of the Availability Zones listed in `availability_zones`.
That is, there should in total
be `length(availability_zones) * 2` subnets.

Hosts in both the public and the private subnets should be able to
initiate connections to hosts on the internet.

Hosts on the internet should be able to initiate connections to hosts in the
public network.

Hosts on the internet should _not_ be able to initiate connections to hosts
in the private network.

Hosts in any subnet in the VPC should be able to initiate connections to hosts
in any subnet in the VPC.

Don't worry too much about possible syntax errors or typos.
We're mostly interested in the architecture and principles
employed in the code, so please do not feel pressured to
test your module by provisioning AWS resources out of pocket.

## Extras

It would be preferable to have as broad IPv4 address blocks as possible assigned
to each subnet, to not unnecessarily limit the number of hosts connected to each subnet.

Try to keep High Availability in mind when it comes to Availability Zones. If one
AZ were to go down completely, we would prefer for the others not to lose
e.g internet connectivity.