module API
  module Exceptions
    class NotFound < StandardError; end
    class NotAuthenticated < StandardError; end
    class NotAuthorized < StandardError; end
    class NoContent < StandardError; end
    class ValidationErrors < StandardError; end
  end
end