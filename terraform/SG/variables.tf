
variable "vpc_id" {
  
}
variable "asgs" {
    type = map
    default = {}
    description = <<EOT
        The following arguments are supported:

        description - (Optional, Forces new resource) Security group description. Defaults to Managed by Terraform. Cannot be "". NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags.
        egress - (Optional, VPC only) Configuration block for egress rules. Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in attribute-as-blocks mode.
        ingress - (Optional) Configuration block for ingress rules. Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in attribute-as-blocks mode.
        name_prefix - (Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name.
        name - (Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name.
        revoke_rules_on_delete - (Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false.
        tags - (Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.
        vpc_id - (Optional, Forces new resource) VPC ID.
        ingress
        This argument is processed in attribute-as-blocks mode.

        The following arguments are required:

        from_port - (Required) Start port (or ICMP type number if protocol is icmp or icmpv6).
        to_port - (Required) End range port (or ICMP code if protocol is icmp).
        protocol - (Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument on the IpPermission API reference. This argument is normalized to a lowercase value to match the AWS API requirement when using with Terraform 0.12.x and above, please make sure that the value of the protocol is specified as lowercase when using with older version of Terraform to avoid an issue during upgrade.
        The following arguments are optional:

        cidr_blocks - (Optional) List of CIDR blocks.
        description - (Optional) Description of this ingress rule.
        ipv6_cidr_blocks - (Optional) List of IPv6 CIDR blocks.
        prefix_list_ids - (Optional) List of Prefix List IDs.
        security_groups - (Optional) List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC.
        self - (Optional) Whether the security group itself will be added as a source to this ingress rule.
        egress
        This argument is processed in attribute-as-blocks mode.

        The following arguments are required:

        from_port - (Required) Start port (or ICMP type number if protocol is icmp)
        to_port - (Required) End range port (or ICMP code if protocol is icmp).
        The following arguments are optional:

        cidr_blocks - (Optional) List of CIDR blocks.
        description - (Optional) Description of this egress rule.
        ipv6_cidr_blocks - (Optional) List of IPv6 CIDR blocks.
        prefix_list_ids - (Optional) List of Prefix List IDs.
        protocol - (Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument in the IpPermission API reference. This argument is normalized to a lowercase value to match the AWS API requirement when using Terraform 0.12.x and above. Please make sure that the value of the protocol is specified as lowercase when used with older version of Terraform to avoid issues during upgrade.
        security_groups - (Optional) List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC.
        self - (Optional) Whether the security group itself will be added as a source to this egress rule.
    EOT
}