rails g scaffold components/categories/kind name:string
rails g scaffold components/item name:string description:string minimum_quantity:integer category_id:string model_id:string price:integer
rails g scaffold components/category name:string description:string kind_id:string
rails g scaffold components/brand name:string description:string
rails g scaffold components/model name:string description:string brand_id:string
rails g scaffold products/item name:string model_id:string minimum_quantity:integer:integer price:integer quantity:integer
rails g scaffold locations/continent name:string
rails g scaffold locations/country name:string continent_id:references
rails g scaffold locations/region name:string country_id:references
rails g scaffold locations/city name:string region_id:references
rails g scaffold requests/purchases/components/status name:string
