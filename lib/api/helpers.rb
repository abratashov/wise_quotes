module API
  module APIHelpers
    def permitted_params
      declared(params, {include_missing: false})
    end
  end
end
