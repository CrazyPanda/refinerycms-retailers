json.retailers @retailers do |retailer|
  json.name retailer.title
  json.address retailer.address
  json.city retailer.city
  json.subregion subregion_name(retailer.country_code, retailer.state_code)
  json.zipcode retailer.zipcode
  json.country country_name(retailer.country_code)
  json.county retailer.county
  json.telephone retailer.phone
  json.fax retailer.fax
  json.distance retailer.distance.ceil
  json.website retailer.website
end