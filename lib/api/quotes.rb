module API
  # Quotes API
  class Quotes < Base
    before do
      # authenticate!
    end

    resource :quotes do
      helpers do
      end

      desc "Get the list of quotes"
      params do
        optional :by_tag, type: String, desc: "Filter by tags: separated by comma(',')"
        paginatable_params.call Quote
      end
      get "", http_codes: standard_responses do
        if params[:by_tag]
          Quote.tagged_with(params[:by_tag].split(','), :any => true).paginate(:page => params[:page], :per_page => params[:per_page])
        else
          Quote.page(params[:page]).per_page(params[:per_page])
        end
      end

      desc "Get the specific quote"
      params do
        requires :id, type: Integer, desc: "Quote ID"
      end
      get ":id", http_codes: standard_responses do
        Quote.where(id: params[:id]).first
      end

      desc "Create a new quote"
      params do
        group :quote do
          requires :body, type: String, desc: "Quote body"
          requires :tag_list, type: String, desc: "Quote tags, separated by comma(',')"
        end
      end
      post "", http_codes: standard_responses(:post) do
        # params[:users] = [] unless params[:users].is_a?(Array) # fix for Swagger UI
        Quote.create! permitted_params[:quote].merge({tags_field: params[:quote][:tag_list]})
      end

      desc "Update a quote"
      params do
        requires :id, type: Integer, desc: "Quote ID"
        group :quote do
          optional :body, type: String, desc: "New quote body"
          optional :tag_list, type: String, desc: "Quote tags, separated by comma(',')"
        end
      end
      put ":id", http_codes: standard_responses(:put) do
        quote = Quote.where(id: params[:id]).first
        #authorize! :update, quote
        if quote && params[:quote][:tag_list]
          quote.update_attributes! permitted_params[:quote].merge({tags_field: params[:quote][:tag_list]})
        else
          quote.update_attributes! permitted_params[:quote] if quote
        end
        quote
      end

      desc "Delete the quote"
      params do
        requires :id, type: Integer, desc: "Quote ID"
      end
      delete ":id", http_codes: standard_responses(:delete) do
        quote = Quote.where(id: params[:id]).first
        # authorize! :destroy, quote
        quote.destroy if quote
        raise ::API::Exceptions::NoContent
      end
    end
  end
end