# require 'erb'
require 'fileutils'
require_relative 'dashboards.rb'

puts "Ensure output directory exist"
FileUtils.mkdir_p "output"

puts "Render example dashboard: ./dashboard/register_default_json"
dashboard = RegisterDashboard.new("exampe1", "magic-server-01", "./dashboards/register_default_json.erb")
dashboard.save()

['test', 'int', 'uat', 'prod'].each do | environment |
  server_name = "register-" + environment + "-01"
  puts "Rendering dashboard for register: " + server_name
  env_dash = RegisterDashboard.new(server_name, server_name, "./dashboards/register_default_json.erb")
  env_dash.save()
end

puts "Render using a hash example: ./dashboards/from_has_example_json.erb"
data = {
  host: "awesome-server-99",
  tag: "godmode"
}
hash_dash = RegisterFromHash.new("from_hash", data, "./dashboards/from_has_example_json.erb")
hash_dash.save()
