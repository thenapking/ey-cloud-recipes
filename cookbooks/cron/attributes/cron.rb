# Add one hash per cron job required
# Set the utility instance name to install each cron job on via instance_name

default[:custom_crons] = [{:name => "receipts", :time => "* /20 * * * *", :command => "mysql cnhr < /data/cnhr/current/sql_imports/production/import_receipts.sql", :instance_name => "cnhr"},
                          {:name => "changes", :time => "* /20 * * * *", :command => "mysql cnhr < /data/cnhr/current/sql_imports/production/export_changes.sql", :instance_name => "cnhr"},
                          {:name => "daily", :time => "0 2 */1 * *", :command => "mysql cnhr < /data/cnhr/current/sql_imports/production/import_people.sql", :instance_name => "cnhr"}]


                        
