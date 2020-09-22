# Description

This repo configures infrastructure for the [referral-service](https://github.com/status-im/referral-service).

Configured by the [`ansible/roles/referral-service`](ansible/roles/referral-service) role.

# Endpoints

* https://prod-referral.status.im/admin - Production
* https://test-referral.status.im/admin - Testing

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/articles/infra_repo_usage.md) doc.

# Deployments

The software running on the hosts uses the [statusteam/referral-service](https://hub.docker.com/r/statusteam/referral-service) Docker image.
The `deploy-test` and `deploy-prod` tags deploy to the `referral.test` and `referral.prod` fleets respectively.

You can find the hosts by using [the Consul catalog](https://consul.status.im/ui/do-ams3/nodes?filter=referral).
