<p align="center">
  <img alt="Ducksify logo" src="https://github.com/ducksify/akamai-toolbox/raw/master/docs/assets/logo.jpg"/>
  <h3 align="center">Akamai Purge Github Action</h3>
  <p align="center">
    <img alt="GitHub license" src="https://badgen.net/github/license/ducksify/akamai-toolbox?cache=300&color=green"/>
  </p>
</p>

## Description
Allows you to trigger cache invalidations directly from your Github release workflow.

## Requirements
You need to declare a `EDGERC` secret in your repository containing the following structure :
```
[ccu]
client_secret = your_client_secret
host = your_host
access_token = your_access_token
client_token = your_client_token
```
Those values can be retrieved from your account on Akamai Control Center.

## Inputs

### `type`
**Required**
Type of purge :
- cpcode : Purge by cpcode
- tag : Purge by Cache Tag

### `ref`
**Required** 
CPCode or Cache Tag to purge


## Example usage

```YAML
uses: ducksify/action-akamai-purge@1.1
id: test
env:
  EDGERC: ${{ secrets.EDGERC }}
with:
  type: 'tag'
  ref: 'testtag'
```
