Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '122533867816948', '9c64f15c3a2837e17e993208466b8188'
end