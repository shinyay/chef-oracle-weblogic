#
# Cookbook Name:: oracle-weblogic
# Recipe:: install
#
# Copyright (c) 2016 Shinya Yanagihara, All Rights Reserved.

# log  "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Starting execution phase"
puts "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Starting compile phase"

#############################
# Install WebLogic
execute 'install weblogic server' do
  user node['weblogic']['user']
  group node['weblogic']['group']
  command "java -Xmx#{node['weblogic']['java']['mx']} -jar #{node['weblogic']['install_image']} -silent -responseFile #{node['weblogic']['response_file']} -invPtrLoc #{node['weblogic']['inventory_pointer_file']}"
  not_if { Dir.exist?("#{node['weblogic']['mw_home']}") }
end

# log  "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Finished execution phase"
puts "####{cookbook_name}::#{recipe_name} #{Time.now.inspect}: Finished compile phase"
