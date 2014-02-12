require "#{Rails.root}/lib/api/base.rb"
Dir["#{Rails.root}/lib/api/*.rb"].each {|file| require file}

module API
  class API < Grape::API
    version 'v1', using: :path
    prefix 'api'

    include Rescuers

    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    helpers APIHelpers

    # before do
    #   maintain_usergroup
    # end

    mount Quotes
    mount Tags
    add_swagger_documentation mount_path: '/swagger_doc', api_version: 'v1', hide_documentation_path: true, markdown: true
  end
end