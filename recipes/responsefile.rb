#
# Cookbook Name:: oracle-weblogic
# Recipe:: responsefile
#
# Copyright (c) 2016 Shinya Yanagihara, All Rights Reserved.

# log  "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Starting execution phase"
puts "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Starting compile phase"

#############################
# Crete WebLogic Install Response file
template node['weblogic']['response_file'] do
  source 'install_weblogic.rsp.erb'
  owner node['weblogic']['owner']
  group node['weblogic']['group']
  mode '0644'
end

# log  "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Finished execution phase"
puts "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Finished compile phase"
