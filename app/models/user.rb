class User < ApplicationRecord
    self.table_name = "admin_users" #because one migration changes table name 
end
