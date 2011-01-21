Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '122533867816948', '9c64f15c3a2837e17e993208466b8188' #this is for live
  
  provider :facebook, '187624934590653', '24a3d96f7b207f7aebbbde8bf6d08a04' #this is for http://www.cincopreguntas.local:3000/
  
  
  
  # Nombre de la aplicación:  5palabritas.com
  # URL de la aplicación: http://www.cincopreguntas.local:3000/
  # identificación de aplicación: 187624934590653
  # Código secreto de la aplicación:  24a3d96f7b207f7aebbbde8bf6d08a04  
  
  
end