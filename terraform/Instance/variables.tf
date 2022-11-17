variable "instances" {
    type = map
    description = <<EOT
        ami - (Optional) AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template.

        associate_public_ip_address - (Optional) Whether to associate a public IP address with an instance in a VPC.

        availability_zone - (Optional) AZ to start the instance in.

        capacity_reservation_specification - (Optional) Describes an instance's Capacity Reservation targeting option. See Capacity Reservation Specification below for more details.

        NOTE:Changing cpu_core_count and/or cpu_threads_per_core will cause the resource to be destroyed and re-created.

        cpu_core_count - (Optional) Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API.
        cpu_threads_per_core - (Optional - has no effect unless cpu_core_count is also set) If set to to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set. See Optimizing CPU Options for more information.
        credit_specification - (Optional) Configuration block for customizing the credit specification of the instance. See Credit Specification below for more details. Terraform will only perform drift detection of its value when present in a configuration. Removing this configuration on existing instances will only stop managing it. It will not change the configuration back to the default for the instance type.
        disable_api_termination - (Optional) If true, enables EC2 Instance Termination Protection.
        ebs_block_device - (Optional) One or more configuration blocks with additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation. See Block Devices below for details on attributes and drift detection. When accessing this as an attribute reference, it is a set of objects.
        ebs_optimized - (Optional) If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information.
        enclave_options - (Optional) Enable Nitro Enclaves on launched instances. See Enclave Options below for more details.
        ephemeral_block_device - (Optional) One or more configuration blocks to customize Ephemeral (also known as "Instance Store") volumes on the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a set of objects.
        get_password_data - (Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information.
        hibernation - (Optional) If true, the launched EC2 instance will support hibernation.
        host_id - (Optional) ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host.
        iam_instance_profile - (Optional) IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole.
        instance_initiated_shutdown_behavior - (Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information.
        instance_type - (Optional) The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.
        ipv6_address_count- (Optional) A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet.
        ipv6_addresses - (Optional) Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface
        key_name - (Optional) Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource.
        launch_template - (Optional) Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template. See Launch Template Specification below for more details.
        maintenance_options - (Optional) The maintenance and recovery options for the instance. See Maintenance Options below for more details.
        metadata_options - (Optional) Customize the metadata options of the instance. See Metadata Options below for more details.
        monitoring - (Optional) If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)
        network_interface - (Optional) Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details.
        placement_group - (Optional) Placement Group to start the instance in.
        placement_partition_number - (Optional) The number of the partition the instance is in. Valid only if the aws_placement_group resource's strategy argument is set to "partition".
        private_ip - (Optional) Private IP address to associate with the instance in a VPC.
        root_block_device - (Optional) Configuration block to customize details about the root block device of the instance. See Block Devices below for details. When accessing this as an attribute reference, it is a list containing one object.
        secondary_private_ips - (Optional) A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e., referenced in a network_interface block. Refer to the Elastic network interfaces documentation to see the maximum number of private IP addresses allowed per instance type.
        security_groups - (Optional, EC2-Classic and default VPC only) A list of security group names to associate with.
        NOTE:
        If you are creating Instances in a VPC, use vpc_security_group_ids instead.

        source_dest_check - (Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true.
        subnet_id - (Optional) VPC Subnet ID to launch in.
        tags - (Optional) A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.
        tenancy - (Optional) Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command.
        user_data - (Optional) User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate.
        user_data_base64 - (Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. Updates to this field will trigger a stop/start of the EC2 instance by default. If the user_data_replace_on_change is set then updates to this field will trigger a destroy and recreate.
        user_data_replace_on_change - (Optional) When used in combination with user_data or user_data_base64 will trigger a destroy and recreate when set to true. Defaults to false if not set.
        volume_tags - (Optional) A map of tags to assign, at instance-creation time, to root and EBS volumes.
        NOTE:
        Do not use volume_tags if you plan to manage block device tags outside the aws_instance configuration, such as using tags in an aws_ebs_volume resource attached via aws_volume_attachment. Doing so will result in resource cycling and inconsistent behavior.

        vpc_security_group_ids - (Optional, VPC only) A list of security group IDs to associate with.

        Timeouts
        The timeouts block allows you to specify timeouts for certain actions:

        create - (Defaults to 10 mins) Used when launching the instance (until it reaches the initial running state)
        update - (Defaults to 10 mins) Used when stopping and starting the instance when necessary during update - e.g., when changing instance type
        delete - (Defaults to 20 mins) Used when terminating the instance



        Capacity Reservation Specification
        NOTE:
        You can specify only one argument at a time. If you specify both capacity_reservation_preference and capacity_reservation_target, the request fails. Modifying capacity_reservation_preference or capacity_reservation_target in this block requires the instance to be in stopped state.

        Capacity reservation specification can be applied/modified to the EC2 Instance at creation time or when the instance is stopped.

        The capacity_reservation_specification block supports the following:

        capacity_reservation_preference - (Optional) Indicates the instance's Capacity Reservation preferences. Can be "open" or "none". (Default: "open").
        capacity_reservation_target - (Optional) Information about the target Capacity Reservation. See Capacity Reservation Target below for more details.
        For more information, see the documentation on Capacity Reservations.

        Capacity Reservation Target
        NOTE:
        Modifying capacity_reservation_id in this block requires the instance to be in stopped state.

        Describes a target Capacity Reservation.

        This capacity_reservation_target block supports the following:

        capacity_reservation_id - (Optional) The ID of the Capacity Reservation in which to run the instance.
        capacity_reservation_resource_group_arn - (Optional) The ARN of the Capacity Reservation resource group in which to run the instance.
        Credit Specification
        The credit_specification block supports the following:

        cpu_credits - (Optional) Credit option for CPU usage. Valid values include standard or unlimited. T3 instances are launched as unlimited by default. T2 instances are launched as standard by default.
        EBS, Ephemeral, and Root Block Devices
        Each of the *_block_device attributes control a portion of the EC2 Instance's "Block Device Mapping". For more information, see the AWS Block Device Mapping documentation.

        The root_block_device block supports the following:

        delete_on_termination - (Optional) Whether the volume should be destroyed on instance termination. Defaults to true.
        encrypted - (Optional) Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection.
        iops - (Optional) Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
        kms_key_id - (Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
        tags - (Optional) A map of tags to assign to the device.
        throughput - (Optional) Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
        volume_size - (Optional) Size of the volume in gibibytes (GiB).
        volume_type - (Optional) Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2.
        Modifying the encrypted or kms_key_id settings of the root_block_device requires resource replacement.

        Each ebs_block_device block supports the following:

        delete_on_termination - (Optional) Whether the volume should be destroyed on instance termination. Defaults to true.
        device_name - (Required) Name of the device to mount.
        encrypted - (Optional) Enables EBS encryption on the volume. Defaults to false. Cannot be used with snapshot_id. Must be configured to perform drift detection.
        iops - (Optional) Amount of provisioned IOPS. Only valid for volume_type of io1, io2 or gp3.
        kms_key_id - (Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.
        snapshot_id - (Optional) Snapshot ID to mount.
        tags - (Optional) A map of tags to assign to the device.
        throughput - (Optional) Throughput to provision for a volume in mebibytes per second (MiB/s). This is only valid for volume_type of gp3.
        volume_size - (Optional) Size of the volume in gibibytes (GiB).
        volume_type - (Optional) Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2.
        NOTE:
        Currently, changes to the ebs_block_device configuration of existing resources cannot be automatically detected by Terraform. To manage changes and attachments of an EBS block to an instance, use the aws_ebs_volume and aws_volume_attachment resources instead. If you use ebs_block_device on an aws_instance, Terraform will assume management over the full set of non-root EBS block devices for the instance, treating additional block devices as drift. For this reason, ebs_block_device cannot be mixed with external aws_ebs_volume and aws_volume_attachment resources for a given instance.

        Each ephemeral_block_device block supports the following:

        device_name - The name of the block device to mount on the instance.
        no_device - (Optional) Suppresses the specified device included in the AMI's block device mapping.
        virtual_name - (Optional) Instance Store Device Name (e.g., ephemeral0).
        Each AWS Instance type has a different set of Instance Store block devices available for attachment. AWS publishes a list of which ephemeral devices are available on each type. The devices are always identified by the virtual_name in the format ephemeral{0..N}.

        Enclave Options
        NOTE:
        Changing enabled will cause the resource to be destroyed and re-created.

        Enclave options apply to the instance at boot time.

        The enclave_options block supports the following:

        enabled - (Optional) Whether Nitro Enclaves will be enabled on the instance. Defaults to false.
        For more information, see the documentation on Nitro Enclaves.

        Maintenance Options
        The maintenance_options block supports the following:

        auto_recovery - (Optional) The automatic recovery behavior of the Instance. Can be "default" or "disabled". See Recover your instance for more details.
        Metadata Options
        Metadata options can be applied/modified to the EC2 Instance at any time.

        The metadata_options block supports the following:

        http_endpoint - (Optional) Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled.
        http_put_response_hop_limit - (Optional) Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64. Defaults to 1.
        http_tokens - (Optional) Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required. Defaults to optional.
        instance_metadata_tags - (optional) Enables or disables access to instance tags from the instance metadata service. Valid values include enabled or disabled. Defaults to disabled.
        For more information, see the documentation on the Instance Metadata Service.

        Network Interfaces
        Each of the network_interface blocks attach a network interface to an EC2 Instance during boot time. However, because the network interface is attached at boot-time, replacing/modifying the network interface WILL trigger a recreation of the EC2 Instance. If you should need at any point to detach/modify/re-attach a network interface to the instance, use the aws_network_interface or aws_network_interface_attachment resources instead.

        The network_interface configuration block does, however, allow users to supply their own network interface to be used as the default network interface on an EC2 Instance, attached at eth0.

        Each network_interface block supports the following:

        delete_on_termination - (Optional) Whether or not to delete the network interface on instance termination. Defaults to false. Currently, the only valid value is false, as this is only supported when creating new network interfaces when launching an instance.
        device_index - (Required) Integer index of the network interface attachment. Limited by instance type.
        network_card_index - (Optional) Integer index of the network card. Limited by instance type. The default index is 0.
        network_interface_id - (Required) ID of the network interface to attach.
        Launch Template Specification
        Note:
        Launch Template parameters will be used only once during instance creation. If you want to update existing instance you need to change parameters directly. Updating Launch Template specification will force a new instance.

        Any other instance parameters that you specify will override the same parameters in the launch template.

        The launch_template block supports the following:

        id - The ID of the launch template. Conflicts with name.
        name - The name of the launch template. Conflicts with id.
        version - Template version. Can be a specific version number, $Latest or $Default. The default value is $Default.
    EOT
    default = {}
}
variable "snet_id" {
  
}
//variable "eip_id" {}
variable "asg_id" {
  
}
variable "key_name" {
  
}