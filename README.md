# Setup server
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
apt-get update
apt-get install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test
docker run hello-world

# Attiva servizi
systemctl enable docker.service
systemctl enable containerd.service

# Git CLI
apt install gh
# Git auth (tramite TOKEN)
# https://dev.to/shafia/support-for-password-authentication-was-removed-please-use-a-personal-access-token-instead-4nbk#:~:text=Please%20use%20a%20personal%20access%20token%20instead.,-While%20pushing%20some&text=Starting%20from%20August%2013%2C%202021,in%20place%20of%20your%20password.
gh auth login
# Download release
gh release download -R <user>/<repository> <tag>
# Clone repository
gh repo clone <user>/<repository>
# Sync repository
gh repo sync

# Lancio container (-d per lanciarla in background)
docker compose up -d

# Nuovo certificato (i path sono quelli specificati nel docker-compose.yaml)
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d <dominio>

# Rinnovo certificati
contab -e -> 0 0 1 * * docker compose run --rm certbot renew