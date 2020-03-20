module MiqAeMethodService
  class MiqAeServiceCloudTenant < MiqAeServiceModelBase
    expose :update_cloud_tenant
    expose :delete_cloud_tenant
    require_dependency "service_models/mixins/miq_ae_external_url_mixin"
    include MiqAeExternalUrlMixin
  end
end
