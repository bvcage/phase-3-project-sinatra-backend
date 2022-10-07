module Searchable

   def search (data, value, exact = false)
      if exact
         where("#{data} = #{value}")
      else
         where("#{data} LIKE ?", "%#{value}%")
      end
   end

end