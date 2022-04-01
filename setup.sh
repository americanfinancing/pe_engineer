#!/bin/bash

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
CR='\033[0m'

docker-compose build

docker-compose run --rm runner /bin/bash <<-EOF
    bundle install && \
    rails db:create && \
    rails db:migrate && \
    rails db:seed
EOF

echo -e "${GREEN}✓ Development environment setup complete.${CR}"
echo -e "  • Rails console - ${YELLOW}docker-compose run --rm runner rails c${CR}"
echo -e "  • Run application containers   - ${YELLOW}docker-compose up rails ionic backend-api${CR}"
