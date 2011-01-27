if RAILS_ENV == "development"
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '137882802940584', 'efd9fe7546e55f2a08da08c1c265190d', {:scope => 'publish_stream email'} #http://5palabritas.local:3000/
    #development
    # Nombre de la aplicación:  5palabritas.com
    # App URL:  http://5palabritas.local:3000/
    # Id de la Aplicacion:  137882802940584
    # Clave secreta de aplicación:  efd9fe7546e55f2a08da08c1c265190d
  end
elsif RAILS_ENV == "production"
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '193968523949418', 'b2c94abc18dfe6ee161c715cd9bddf37', {:scope => 'publish_stream email'} #this is for live
    # production
    # Nombre de la aplicación:  5palabritas.com
    # URL de la aplicación: http://5palabritas.com/
    # identificación de aplicación: 193968523949418
    # Código secreto de la aplicación:  b2c94abc18dfe6ee161c715cd9bddf37
  end
end