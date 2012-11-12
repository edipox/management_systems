rails g scaffold products/compositions/detail composition_id:string components_id:string quantity:integer
rails g scaffold requests/purchases/components/detail header_id:string component_id:string quantity:integer
rails g scaffold requests/transferences/components/detail header_id:string component_id:string quantity:integer
rails g scaffold requests/transferences/products/detail header_id:string product_id:string quantity:integer
rails g scaffold requests/devolutions/products/detail header_id:string product_id:string
rails g scaffold orders/productions/detail product_id:string header_id:string quantity:integer
rails g scaffold requests/devolutions/components/detail header_id:string component_id:string
