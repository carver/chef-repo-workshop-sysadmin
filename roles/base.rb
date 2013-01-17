name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[apt]",
  "recipe[nagios::client]",
  "recipe[chef-client::delete_validation]",
  "recipe[motd-tail]",
  "recipe[ntp]",
  "recipe[postfix::client]",
  "recipe[zsh]",
  "recipe[users::sysadmins]", #requires zsh
  "recipe[sudo]"
)

default_attributes(
  "nagios" => {
    "server_role" => "monitoring"
  },
  "authorization" => {
    "sudo" => {
      "users" => ["opscode"],
      "groups" => ["admin","sudo"],
      "passwordless" => true
                     }
                   },

  "postfix" => {
    "relayhost_role" => "monitoring"
                   }


)
