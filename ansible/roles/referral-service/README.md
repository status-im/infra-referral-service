# Description

This role configures the [referral-service](https://github.com/status-im/referral-service) which purpose is to 

# Configuration

Mostly the service requires certain secrets to be set:
```yaml
# for production cookies
referral_srv_secret_key_base: '128charLongHexadecimal'

# For Play Store integration
referral_srv_google_product_id: 'referral.0'
referral_srv_google_package_name: 'im.status.ethereum'
referral_srv_google_auth_json: '{"AUTH":"JSON"}'

# For sending transactions via Infura
referral_srv_eth_http_endpoint: 'https://mainnet.infura.io/v1/ABC'
referral_srv_eth_contract_address: '0x1234'
referral_srv_eth_contract_name: 'Whatever'
referral_srv_eth_private_key: '0x4321'
```

# Management

There are 4 containers in total:
```
 $ docker ps
CONTAINER ID        NAMES               IMAGE                                CREATED             STATUS
73944b7f9b8b        referral-app     statusteam/referral:deploy-test   2 hours ago         Up 2 hours
69c684944dd7        referral-queue   statusteam/referral:deploy-test   2 hours ago         Up 2 hours
d08c1de07f06        referral-cache   redis:5.0-alpine                     2 hours ago         Up 2 hours
bef8a88c79db        referral-db      postgres:9.6-alpine                  2 hours ago         Up 2 hours
```

And they are created using [Docker Compose](https://docs.docker.com/compose/), which is also the best way to manage them:
```
 $ cd /docker/referral
 $ sudo docker-compose ps  
      Name                     Command               State           Ports         
-----------------------------------------------------------------------------------
referral-app     bundle exec puma -C config ...   Up      0.0.0.0:3000->3000/tcp
referral-cache   redis-server                     Up      6379/tcp              
referral-db      docker-entrypoint.sh postgres    Up      5432/tcp              
referral-queue   bundle exec sidekiq              Up
```
To re-create the containers simply run:
```
 $ sudo docker-compose up -d --force-recreate
```