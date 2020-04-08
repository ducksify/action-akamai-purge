# action-akamai-purge

## WIP
Consolidation of tools to trigger Akamai purge during deployment

## Inputs

### `type`
**Required** Type of purge

### `ref`
**Required** ref


## Example usage

```YAML
uses: actions/akamai-purge@v1
id: test
env:
  EDGERC: ${{ secrets.EDGERC }}
with:
  type: 'tag'
  ref: 'testtag'
```
