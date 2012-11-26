module Settings::ConfigurationsHelper
  def load_company_config
    @name = { id: :company_name, label: 'Nombre de la empresa', value: AppConfig.find(:company_name).value }
    @address = { id: :company_address, label: 'Direccion', value: AppConfig.find(:company_address).value }
    @telephone = { id: :company_telephone, label: 'Telefono', value: AppConfig.find(:company_telephone).value }
    @cellphone = { id: :company_cellphone, label: 'Celular', value: AppConfig.find(:company_cellphone).value }
    @ruc = { id: :company_ruc, label: 'RUC', value: AppConfig.find(:company_ruc).value }
  end
end
