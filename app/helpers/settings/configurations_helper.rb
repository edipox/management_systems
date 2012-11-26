module Settings::ConfigurationsHelper
  def load_company_config
    @name = { id: :company_name, label: 'Nombre de la empresa', value: AppConfig.find(:company_name).value }
  end
end
