# IPFS on Azure - Docker 
This area holds the source for the customized deployment of IPFS in experimental "private network" mode.

## Build instructions
To build Docker will need to be installed.  

``` 
docker build . -t ipfs/azure
```

## Publishing to Azure private repository
To publish a new version of the docker container to the private repository in Azure.  These repositories can be created by following the steps [here](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-portal).  You can then push and pull from these repositories using the standard docker tools [docs here](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli)

### Create a alias of the new image
```
docker tag ipfs/azure ipfspriv.azurecr.io/ipfs/azure
```
### Push the image to repository
```
docker push ipfspriv.azurecr.io/ipfs/azure
```

# Using the docker image
A docker compose file has been created [here](../scripts/docker-compose.yml) that will create the ipfs nodes in private mode.  There are a few environment variables that are required to be passed in, to bootstrap the nodes.

| Variable | Type | Description | Required |
| --- | --- | --- | --- |
| IPFS_VERSION | string | Build version to use | &#x2713; |
| BOOTNODEIP | string | Internal IP of initial bootnode | &#x2713; |
| NODEID | string | The node id (sequence), used to id the initial node | &#x2713; |

`NOTE: If you are using Azure, the ARM template` [here](../marketplace/mainTemplate.json) `will pass the correct values to docker compose and deploy all.`