class CreateUsers < ActiveRecord::Migration[5.2]
 
 # def change
  #  create_table :users do |t|
#
 #     t.timestamps
  #  end
  #end
#end

def up 
  create_table :users do |t|
    #id is added by default
    t.column "first_name", :string, :limit => 25 #By default SQL String limit 255 character 
    #Ex:- :limit => 40
    # Example: t.column "first_name", :string
    t.string "last_name", :limit => 50 #By default SQL String limit 255 character 
    #Ex:- :limit => 40
    t.string "email", :default => '', :null => false
    #Ex:- :null => false
    #Ex:- :default =>''
    t.string "password", :limit => 50 #By default SQL String limit 255 character 
    #Ex:- :limit => 40

    t.timestamps

    #these are the same
    #t.datetime ${"created_at"}
    #${"updated_at"}
  end
end

def down
  drop_table :users
end

end