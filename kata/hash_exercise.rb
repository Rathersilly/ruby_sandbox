contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each do |name,deets|
  p name
  contact_data.each do |i|
    if i[0].downcase.include?(name.downcase[/^.+(?= )/])
      deets[:email] = i[0]
      deets[:address] = i[1]
      deets[:phone] =i[2]

    end
  end
end
p contacts
p contacts["Joe Smith"][:phone]
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
p arr.delete_if{|x| x.start_with?('s') || x.start_with?('w')}
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a.map! {|x| x.split}.flatten!
p a
  



# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }
