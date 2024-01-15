#!/bin/bash
chmod -Rf 777 /app/go-spacemesh/node_data &
/app/go-spacemesh/go-spacemesh --config config.mainnet.json \
    --smeshing-opts-provider $PROVIDER \
    --smeshing-opts-maxfilesize $FILE_SIZE \
    --smeshing-opts-numunits $NUMUNITS \
    --smeshing-opts-proving-nonces $NONCES \
    --smeshing-opts-proving-threads $THREADS \
    --smeshing-opts-verifying-min-workers $POST_MIN_WORKERS \
    --smeshing-opts-verifying-workers $POST_WORKERS \
    --smeshing-start \
    --smeshing-coinbase $SMESHING_COINBASE_ADDRESS \
    --smeshing-opts-datadir /app/go-spacemesh/post_data \
    --data-folder /app/go-spacemesh/node_data \
    --metrics