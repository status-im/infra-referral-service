# Description

This role configures the [referral-service](https://github.com/status-im/referral-service) which purpose is to 

# Configuration

Mostly the service requires certain secrets to be set:
```yaml
# OAuth settings
referral_srv_domain: 'referral.example.org'
referral_srv_public_port: 443
referral_srv_public_protocol: 'https'

# for production cookies
referral_srv_secret_key_base: '128charLongHexadecimal'

# For Play Store integration
referral_srv_google_sign_in_client_id: '1234-abcd..apps.googleusercontent.com'
referral_srv_google_sign_in_client_secret: 'super-secret-secret'

# For sending transactions via Infura
referral_srv_eth_http_endpoint: 'https://mainnet.infura.io/v1/ABC'
referral_srv_eth_contract_address: '0x1234'
referral_srv_eth_contract_name: 'Whatever'
referral_srv_eth_private_key: '0x4321'

# GeoIP API Auth for checking for VPNs and regions
referral_srv_geoip_account_id: '123456'
referral_srv_geoip_license_key: 'abcdefghijklmnrstpwxyz'
```

# Management

There are 4 containers in total:
```
 $ docker ps
CONTAINER ID    NAMES            IMAGE                             CREATED        STATUS
73944b7f9b8b    referral-app     statusteam/referral:deploy-test   2 hours ago    Up 2 hours
69c684944dd7    referral-queue   statusteam/referral:deploy-test   2 hours ago    Up 2 hours
d08c1de07f06    referral-cache   redis:5.0-alpine                  2 hours ago    Up 2 hours
bef8a88c79db    referral-db      postgres:9.6-alpine               2 hours ago    Up 2 hours
```

And they are created using [Docker Compose](https://docs.docker.com/compose/), which is also the best way to manage them:
```
 $ cd /docker/referral
 $ docker-compose ps  
      Name                     Command               State           Ports         
-----------------------------------------------------------------------------------
referral-app     bundle exec puma -C config ...   Up      0.0.0.0:3000->3000/tcp
referral-cache   redis-server                     Up      6379/tcp              
referral-db      docker-entrypoint.sh postgres    Up      5432/tcp              
referral-queue   bundle exec sidekiq              Up
```
To re-create the containers simply run:
```
 $ docker-compose up -d --force-recreate
```
