rails g scaffold components/categories/kind name:string
rails g scaffold components/brand name:string description:string
rails g scaffold components/model name:string description:string brand:string
rails g scaffold products/item name:string model_id:string minimum_quantity:integer

rails g scaffold requests/purchases/components/status name:string

rails g scaffold locations/continent name:string
rails g scaffold locations/country name:string continent:references
rails g scaffold locations/region name:string country:references
rails g scaffold locations/city name:string region:references

rails g scaffold products/compositions/detail header_id:string component_id:string quantity:integer
rails g scaffold requests/purchases/components/detail header_id:string component_id:string quantity:integer
rails g scaffold requests/transferences/components/detail header_id:string component_id:string quantity:integer
rails g scaffold requests/transferences/products/detail header_id:string product_id:string quantity:integer
rails g scaffold requests/devolutions/products/detail	header_id:string	product_id:string
rails g scaffold orders/productions/detail	product_id:string quantity:integer header_id:string
rails g scaffold requests/devolutions/components/detail header_id:string component_id:string

rails g scaffold orders/productions/header	user_id:string	date:date
rails g scaffold requests/devolutions/products/header date:date stock_id:string user_id:string reason:string
rails g scaffold requests/purchases/components/header date:date status_id:string user_id:string
rails g scaffold requests/devolutions/components/header date:date stock_id:string user_id:string reason:string
rails g scaffold requests/transferences/products/header date:date stock_id:string user_id:string
rails g scaffold requests/transferences/components/header date:date stock_id:string user_id:string
rails g scaffold products/compositions/header name:string description:string

