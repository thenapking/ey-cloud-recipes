#
#Cookbook Name:: mysql_cron_job
#Recipe::default
#

if node[:name] == 'cnhr' and (node[:instance_role].include?('db_master') or node[:instance_role].include?('db_slave') )
  #is the node a project, environment or Server instance?  If the latter how do I find their names?
  cron "receipts" do 
    minute '*/20' 
    user 'root' 
    command "mysql cnhr < /data/cnhr/current/sql_imports/production/import_receipts.sql" 
  end 

  cron "changes" do 
    minute '*/20' 
    user 'root' 
    command "mysql cnhr < /data/cnhr/current/sql_imports/production/export_changes.sql" 
  end 

  cron "daily" do 

    daily '0 2 */1' 
    user 'root' 
    command "mysql cnhr < /data/cnhr/current/sql_imports/production/import_people.sql" 
  end 
end 