require 'json'

# json_hash = {"json_class"=>"Grocery_list", "data"=>{"username"=>"Brett Sanders", "list"=>{"milk"=>1, "eggs"=>1}, "bought"=>{"milk"=>1}}}

# puts JSON.parse(json_hash)

j = '{"sections": {
       "0": {},
       "1": {}
     }}'

p JSON.parse(j)