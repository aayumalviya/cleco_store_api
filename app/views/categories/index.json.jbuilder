debugger
json.array! @categories do |category|
    json.id category.id
    json.name category.name
    # json.logoUrl url_for(category.logo)

end