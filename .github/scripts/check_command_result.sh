#!/bin/bash

succeeded () {
  status=$(aws ssm get-command-invocation --command-id $1 --instance-id $2 | jq .Status)
  if [ ${status} = "\"Success\"" ]; then
    echo true
  else
    echo false
  fi
}

commandId=$1
instanceId=$2
i=1

while [ $i -le 40 ];
do
  succeeded=$(succeeded ${commandId} ${instanceId})
  if "${succeeded}"; then
    exit 0
  fi
  ((i++))
  sleep 5
done

exit 1
