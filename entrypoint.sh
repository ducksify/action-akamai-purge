#!/usr/bin/env bash
set -e
set -o pipefail

_PURGE_COMMAND=$1
_PURGE_TYPE=$2
_PURGE_REF=$3

if [[ ${_PURGE_COMMAND} != "delete" ]] && [[ ${_PURGE_COMMAND} != "invalidate" ]]
then
  echo "Unknown command '${_PURGE_COMMAND}' ... exiting"
  exit 123
fi

case ${_PURGE_TYPE} in
  cpcode)
    _CLI_OPT="--cpcode"
  ;;

  tag)
    _CLI_OPT="--tag"
  ;;

  *)
    echo "Unknown type '${_PURGE_TYPE}' ... exiting"
    exit 123
  ;;
esac

# Create /root/.edgerc file from env variable
echo -e "${EDGERC}" > /root/.edgerc

# Send purge request
/usr/local/bin/purge \
  --edgerc /root/.edgerc \
  --section ccu \
  ${_PURGE_COMMAND} \
  ${_CLI_OPT} "${_PURGE_REF}"
