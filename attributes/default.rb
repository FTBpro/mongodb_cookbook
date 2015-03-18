default['mongodb']['config']['auth'] = true
default['mongodb']['config']['bind_ip'] = "0.0.0.0"

admin_user = 
  begin
    Chef::DataBagItem.load("mongodb", "admin_user")
  rescue
    { 'username' => "testuser", 'password' => "testpass" }
  end

default['mongodb']['admin'] = {
  username: admin_user['username'],
  password: admin_user['password'],
  roles: %w(userAdminAnyDatabase dbAdminAnyDatabase readWriteAnyDatabase clusterAdmin)
}
