name "monitoring"
description "Monitoring server"
run_list(
  "recipe[nagios::server]",
  "recipe[postfix::server]"
)

default_attributes(
  "nagios" => {
    "server_auth_method" => "htauth"
  },
  "ntp" => {
    "is_server" => true,
                   },
                   "postfix" => {
                     "mydomain" => "example.com",
                     "mail_relay_networks" => "127.0.0.0/8 10.12.13.0/24"
                   }
)
