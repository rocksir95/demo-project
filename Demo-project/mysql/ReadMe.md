terraform-google-sql for MySQL

Note: CloudSQL provides disk autoresize feature which can cause a Terraform configuration drift due to the value in disk_size variable, and hence any updates to this variable is ignored in the Terraform lifecycle.

Inputs
Name Description Type Default Required
activation_policy The activation policy for the master instance. Can be either ALWAYS, NEVER or ON_DEMAND. string "ALWAYS" no
additional_databases A list of databases to be created in your cluster
list(object({
    name      = string
    charset   = string
    collation = string
  }))
[] no
additional_users A list of users to be created in your cluster list(map(any)) [] no
availability_type The availability type for the master instance. Can be either REGIONAL or null. string "REGIONAL" no
backup_configuration The backup_configuration settings subblock for the database setings
object({
    binary_log_enabled             = bool
    enabled                        = bool
    start_time                     = string
    location                       = string
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
{
  "binary_log_enabled": false,
  "enabled": false,
  "location": null,
  "retained_backups": null,
  "retention_unit": null,
  "start_time": null,
  "transaction_log_retention_days": null
}
no
create_timeout The optional timout that is applied to limit long database creates. string "10m" no
database_flags List of Cloud SQL flags that are applied to the database server. See more details
list(object({
    name  = string
    value = string
  }))
[] no
database_version The database version to use string n/a yes
db_charset The charset for the default database string "" no
db_collation The collation for the default database. Example: 'utf8_general_ci' string "" no
db_name The name of the default database to create string "default" no
delete_timeout The optional timout that is applied to limit long database deletes. string "10m" no
deletion_protection Used to block Terraform from deleting a SQL Instance. bool true no
disk_autoresize Configuration to increase storage size bool true no
disk_autoresize_limit The maximum size to which storage can be auto increased. number 0 no
disk_size The disk size for the master instance number 10 no
disk_type The disk type for the master instance. string "PD_SSD" no
enable_default_db Enable or disable the creation of the default database bool true no
enable_default_user Enable or disable the creation of the default user bool true no
encryption_key_name The full path to the encryption key used for the CMEK disk encryption string null no
insights_config The insights_config settings for the database.
object({
    query_string_length     = number
    record_application_tags = bool
    record_client_address   = bool
  })
null no
ip_configuration The ip_configuration settings subblock
object({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool
    allocated_ip_range  = string
  })
{
  "allocated_ip_range": null,
  "authorized_networks": [],
  "ipv4_enabled": true,
  "private_network": null,
  "require_ssl": null
}
no
maintenance_window_day The day of week (1-7) for the master instance maintenance. number 1 no
maintenance_window_hour The hour of day (0-23) maintenance window for the master instance maintenance. number 23 no
maintenance_window_update_track The update track of maintenance window for the master instance maintenance. Can be either canary or stable. string "canary" no
module_depends_on List of modules or resources this module depends on. list(any) [] no
name The name of the Cloud SQL resources string n/a yes
pricing_plan The pricing plan for the master instance. string "PER_USE" no
project_id The project ID to manage the Cloud SQL resources string n/a yes
random_instance_name Sets random suffix at the end of the Cloud SQL resource name bool false no
read_replica_deletion_protection Used to block Terraform from deleting replica SQL Instances. bool false no
read_replica_name_suffix The optional suffix to add to the read instance name string "" no
read_replicas List of read replicas to create. Encryption key is required for replica in different region. For replica in same region as master set encryption_key_name = null
list(object({
    name                  = string
    tier                  = string
    zone                  = string
    availability_type     = string
    disk_type             = string
    disk_autoresize       = bool
    disk_autoresize_limit = number
    disk_size             = string
    user_labels           = map(string)
    database_flags = list(object({
      name  = string
      value = string
    }))
    ip_configuration = object({
      authorized_networks = list(map(string))
      ipv4_enabled        = bool
      private_network     = string
      require_ssl         = bool
      allocated_ip_range  = string
    })
    encryption_key_name = string
  }))
[] no
region The region of the Cloud SQL resources string "us-central1" no
replica_database_version The read replica database version to use. This var should only be used during a database update. The update sequence 1. read-replica 2. master, setting this to an updated version will cause the replica to update, then you may update the master with the var database_version and remove this field after update is complete string "" no
secondary_zone The preferred zone for the secondary/failover instance, it should be something like: us-central1-a, us-east1-c. string null no
tier The tier for the master instance. string "db-n1-standard-1" no
update_timeout The optional timout that is applied to limit long database updates. string "10m" no
user_host The host for the default user string "%" no
user_labels The key/value labels for the master instances. map(string) {} no
user_name The name of the default user string "default" no
user_password The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable. string "" no
zone The zone for the master instance, it should be something like: us-central1-a, us-east1-c. string n/a yes
Outputs
Name Description
additional_users List of maps of additional users and passwords
generated_user_password The auto generated default user password if not input password was provided
instance_connection_name The connection name of the master instance to be used in connection strings
instance_first_ip_address The first IPv4 address of the addresses assigned for the master instance.
instance_ip_address The IPv4 address assigned for the master instance
instance_name The instance name for the master instance
instance_self_link The URI of the master instance
instance_server_ca_cert The CA certificate information used to connect to the SQL instance via SSL
instance_service_account_email_address The service account email address assigned to the master instance
instances A list of all google_sql_database_instance resources we've created
primary The google_sql_database_instance resource representing the primary instance
private_address The private IP address assigned for the master instance
private_ip_address The first private (PRIVATE) IPv4 address assigned for the master instance
public_ip_address The first public (PRIMARY) IPv4 address assigned for the master instance
read_replica_instance_names The instance names for the read replica instances
replicas A list of google_sql_database_instance resources representing the replicas
replicas_instance_connection_names The connection names of the replica instances to be used in connection strings
replicas_instance_first_ip_addresses The first IPv4 addresses of the addresses assigned for the replica instances
replicas_instance_self_links The URIs of the replica instances
replicas_instance_server_ca_certs The CA certificates information used to connect to the replica instances via SSL
replicas_instance_service_account_email_addresses The service account email addresses assigned to the replica instances
