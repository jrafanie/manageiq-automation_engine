module MiqAeMethodService
  class MiqAeServiceTenant < MiqAeServiceModelBase
    require_dependency "service_models/mixins/miq_ae_external_url_mixin"
    include MiqAeExternalUrlMixin
  end
end
