#!/bin/bash

#------------------------------------------------------------------------------
# compose_json
#------------------------------------------------------------------------------

function compose_json {

  COUNT=$(ls containers/*/marathon.json | wc -l)

  # JSON header:
  echo '{'
  echo '  "id": "/tva",'
  echo '    "apps": ['

  # JSON body:
  for i in containers/*/marathon.json; do

    cat ${i}

    [ ${COUNT} -gt 1 ] && {
      echo -n ','
      COUNT=$((COUNT - 1))
    }

  done

  # JSON footer:
  echo '  ]'
  echo '}'

}
