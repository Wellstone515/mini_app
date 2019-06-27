 # DB設計


 ## users table

 | Column |  Type  |   Options
 |--------|--------|---------------------------------------
 | name   | string | index: true, null: false, unique: true
 | mail   | string | null: false, unique: true

 ### Association

  - has_many :posts


 ## posts table

 |    Column    |  Type     |   Options
 |--------------|-----------|------------------
 |     body     |  text     | null: false
 |    user_id   |references | null: false, foreeign_key: true

 ### Association

  - bolongs_to :user