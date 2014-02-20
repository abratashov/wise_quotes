class Quote < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tag_list

  after_save :socky_update

  def socky_update
    WiseQuotes::Application.socky.trigger!('quote_save_event', :channel => 'quotes_channel', :data => 'need to refresh!')
  rescue
  end
end
