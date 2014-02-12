module API
  class Base < Grape::API

    def self.standard_responses method = :get, additional = [], override = false
      codes = []
      codes << [200, "OK"] if method == :get || method == :put
      codes << [201, "Created"] if method == :post
      codes << [204, "No content (deleted successfully)"] if method == :delete
      codes << [418, "I'm a teapot"] if Date.today.mon == 4 && Date.today.mday == 1
      codes << [401, "You are not authenticated"]
      codes << [403, "You are not authorized to do this"]
      codes << [422, "Something wrong with the request attributes"]
      return codes + additional
    end
  end
end