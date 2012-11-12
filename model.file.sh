rails g model stocks/component component_id:string quantity:integer
rails g model stocks/production component_id:string quantity:integer
rails g model stocks/product product_id:string quantity:integer
rails g model stocks/transactions/component kind:string kind_id:string
rails g model stocks/transactions/production kind:string kind_id:string
rails g model stocks/transactions/product kind:string kind_id:string
