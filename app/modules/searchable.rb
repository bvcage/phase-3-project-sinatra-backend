module Searchable

   def search (data, value)
      where("#{data} LIKE ?", "%#{value}%")
   end

end