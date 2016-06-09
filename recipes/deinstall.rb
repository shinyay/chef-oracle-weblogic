#
# Cookbook Name:: oracle-weblogic
# Recipe:: deinstall
#
# Copyright (c) 2016 Shinya Yanagihara, All Rights Reserved.

# log  "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Starting execution phase"
puts "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Starting compile phase"

#############################
# Uninstall WebLogic
execute 'Uninstall weblogic server' do
  user node['weblogic']['user']
  group node['weblogic']['group']
  command "#{node['weblogic']['mw_home']}/oui/bin/deinstall.sh -silent -responseFile #{node['weblogic']['response_file_uninstall']}"
  only_if { Dir.exist?("#{node['weblogic']['wls_home']}") }
  notifies :delete, "directory[#{node['weblogic']['mw_home']}]", :immediately
end

directory node['weblogic']['mw_home'] do
  recursive true
  action :nothing
end

# log  "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Finished execution phase"
puts "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Finished compile phase"
