# IPFS on Azure - Docker 
This area holds the source for the customized deployment of IPFS in experimental "private network" mode.

## Build instructions
To build Docker will need to be installed.  

``` 
docker build . -t ipfs/azure
```

## Publishing to Azure private repository
To publish a new version of the docker container to the private repository in Azure.

### Create a alias of the new image
```
docker tag ipfs/azure ipfspriv.azurecr.io/ipfs/azure
```
### Push the image to repository
```
docker push ipfspriv.azurecr.io/ipfs/azure
```