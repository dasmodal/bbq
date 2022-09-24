set :stage, :production

server "grillmeal.ru", user: "deploy", roles: %w{app db web}
