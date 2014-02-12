module API
  # Tags API
  class Tags < Base
    before do
      # authenticate!
    end

    resource :tags do
      desc "Get the list of tags"
      get "", http_codes: standard_responses do
        Quote.tag_counts_on(:tags)
      end

    end
  end
end