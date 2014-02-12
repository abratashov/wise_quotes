module WillPaginate
  module ActiveRecord
    module RelationMethods
      def per_page(value = nil)
        if value.nil? then limit_value
        elsif value == 0 then limit(9999*9999)
        else limit(value)
        end
      end
    end
  end
end