#!/bin/bash

args="-i $ROLE/tests/inventory $ROLE/tests/$PLAYBOOK"
run_args="--connection=local --sudo"

function check_idempotency {
    grep -q 'changed=0.*failed=0' &&
    (echo 'Idempotence test: pass' && exit 0) ||
    (echo 'Idempotence test: fail' && exit 1)
}

case $1 in
    "syntax") exec ansible-playbook $args --syntax-check ;;
    "run") exec ansible-playbook $args $run_args ;;
    "idempotent") exec ansible-playbook $args $run_args | check_idempotency ;;
    *) exec "$@" ;;
esac