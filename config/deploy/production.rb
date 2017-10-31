# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server 'laravel-blog.com', user: 'ubuntu', roles: %w{app db web}

after 'deploy:updating', 'docker:compose'
after 'deploy:updating', 'docker:build'
after 'deploy:updating', 'laravel:resolve_acl_paths'
after 'deploy:updating', 'laravel:ensure_acl_paths_exist'
after 'deploy:updating', 'composer:install'
after 'deploy:updating', 'node:install'
after 'deploy:updating', 'node:build'
after 'deploy:updating', 'laravel:env'
after 'deploy:updating', 'docker:down'
after 'deploy:updating', 'laravel:migrate'
after 'deploy:updating', 'laravel:seeds'
after 'deploy:updating', 'docker:up'
