class Settings::ConfigurationsController < ApplicationController
  include Settings::ConfigurationsHelper
  def company
    load_company_config
  end

  def update
    before_update
    params.each do |key, value|
      puts "#{key} #{value}"
      begin
        app_config = AppConfig.find(key)
        app_config.value = value
        app_config.save
      rescue ActiveRecord::RecordNotFound
      end
    end
    @notice = 'Las configuraciones han sido guardadas'
    redirect_to :settings
  end
end
