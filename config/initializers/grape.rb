# here we are mixing some new functionality to Grape

module Grape
  module Validations
    class ParamsScope
      def paginatable_params
        -> (klass) do
          optional :page, type: Integer, default: 1, desc: "Page number (default: 1)"
          optional :per_page, type: Integer, default: klass.per_page, desc: "Number of elements per page (default: #{klass.per_page}, return all if 0 passed)"
        end
      end
    end
  end
end