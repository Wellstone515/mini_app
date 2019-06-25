 # DB設計


 ## users table

 | Column |  Type  |   Options
 |--------|--------|---------------------------------------
 | name   | string | index: true, null: false, unique: true
 | mail   | string | null: false, unique: true

 ### Association

  - has_many :posts


 ## posts table

 |    Column    |  Type  |   Options
 |--------------|--------|------------------
 |     body     |  text  | null: false

 ### Association

  - bolongs_to :user