 See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "praveenadmin"
validation_client_name "praveenorg-validator"
validation_key         "#{current_dir}/praveenorg-validator.pem
client_key               "#{current_dir}/praveenadmin.pem"
chef_server_url          "https://13.126.75.160/organizations/praveeorg"
cookbook_path            ["#{current_dir}/../cookbooks"]
ssl_verify_mode 		:verify_none



log_level :info
log_location     STDOUT
chef_server_url  "https://13.126.75.160/organizations/praveenorg"
validation_client_name "praveenorg-validator"
validation_key "#{current_dir}/praveenorg-validator.pem
ssl_verify_mode  :verify_none
