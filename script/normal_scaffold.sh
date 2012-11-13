rails g scaffold components/categories/kind name:string -f
#rails g scaffold components/item name:string description:string minimum_quantity:integer category_id:string model_id:string price:integer -f
#rails g scaffold components/category name:string description:string kind_id:string -f
rails g scaffold components/brand name:string description:string -f
rails g scaffold components/model name:string description:string brand_id:string -f
rails g scaffold products/item name:string model_id:string minimum_quantity:integer:integer price:integer quantity:integer -f
rails g scaffold locations/continent name:string -f
rails g scaffold locations/country name:string continent_id:references -f
rails g scaffold locations/region name:string country_id:references -f
rails g scaffold locations/city name:string region_id:references -f
rails g scaffold transactions/status name:string -f
