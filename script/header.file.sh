rails g scaffold products/composition name:string description:string -f
rails g scaffold requests/purchases/component status_id:string user_id:string transaction_id:string -f
rails g scaffold requests/transferences/component status_id:string user_id:string transaction_id:string  -f
rails g scaffold requests/transferences/product status_id:string transaction_id:string user_id:string  -f
rails g scaffold requests/devolutions/product transaction_id:string user_id:string reason:string status_id:string -f
rails g scaffold orders/production transaction_id:string status_id:string user_id:string  -f
rails g scaffold requests/devolutions/component transaction_id:string status_id:string user_id:string reason:string -f
