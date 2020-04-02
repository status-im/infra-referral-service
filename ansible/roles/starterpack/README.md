# Description

This role configures the [starterpack-service](https://github.com/status-im/starterpack-service) which purpose is to 

# Configuration

Mostly the service requires certain secrets to be set:
```yaml
# for production cookies
starterpack_secret_key_base: '128charLongHexadecimal'

# For Play Store integration
starterpack_google_product_id: 'starterpack.0'
starterpack_google_package_name: 'im.status.ethereum'
starterpack_google_auth_json: '{"AUTH":"JSON"}'

# For sending transactions via Infura
starterpack_eth_http_endpoint: 'https://mainnet.infura.io/v1/ABC'
starterpack_eth_contract_address: '0x1234'
starterpack_eth_contract_name: 'Whatever'
starterpack_eth_private_key: '0x4321'
```

# Management

There are 4 containers in total:
```
 $ docker ps
CONTAINER ID        NAMES               IMAGE                                CREATED             STATUS
73944b7f9b8b        starterpack-app     statusteam/starterpack:deploy-test   2 hours ago         Up 2 hours
69c684944dd7        starterpack-queue   statusteam/starterpack:deploy-test   2 hours ago         Up 2 hours
d08c1de07f06        starterpack-cache   redis:5.0-alpine                     2 hours ago         Up 2 hours
bef8a88c79db        starterpack-db      postgres:9.6-alpine                  2 hours ago         Up 2 hours
```

And they are created using [Docker Compose](https://docs.docker.com/compose/), which is also the best way to manage them:
```
 $ cd /docker/starterpack
 $ sudo docker-compose ps  
      Name                     Command               State           Ports         
-----------------------------------------------------------------------------------
starterpack-app     bundle exec puma -C config ...   Up      0.0.0.0:3000->3000/tcp
starterpack-cache   redis-server                     Up      6379/tcp              
starterpack-db      docker-entrypoint.sh postgres    Up      5432/tcp              
starterpack-queue   bundle exec sidekiq              Up
```
To re-create the containers simply run:
```
 $ sudo docker-compose up -d --force-recreate
```
