FROM golang:1.21.6 AS builder
ARG VERSION
RUN apt update && apt install -y \
    git git-lfs make curl jq build-essential unzip wget ocl-icd-opencl-dev ocl-icd-libopencl1 \
    && git-lfs install
WORKDIR /container/go-spacemesh
RUN VERSION=$(curl -s "https://api.github.com/repos/spacemeshos/go-spacemesh/releases/latest" | jq -r ".tag_name") && echo $VERSION > /version.txt
RUN git clone --progress --verbose https://github.com/spacemeshos/go-spacemesh . \
    && /bin/bash -c "git checkout $(cat /version.txt)" \
    && make get-libs && make install && make build \
    && chmod +x build/go-spacemesh
RUN wget https://configs.spacemesh.network/config.mainnet.json

FROM ubuntu:22.04
COPY --from=builder /container/go-spacemesh/build /app/go-spacemesh
COPY --from=builder /container/go-spacemesh/config.mainnet.json /app/go-spacemesh
COPY --from=builder /version.txt /app/go-spacemesh
RUN apt update && apt install -y ocl-icd-libopencl1 ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app/go-spacemesh

ADD https://github.com/fullstorydev/grpcurl/releases/download/v1.8.9/grpcurl_1.8.9_linux_x86_64.tar.gz /bin/
RUN tar -zxvf /bin/grpcurl_1.8.9_linux_x86_64.tar.gz -C /bin/ \
    && rm /bin/grpcurl_1.8.9_linux_x86_64.tar.gz  \
    && echo "#! /bin/bash \n grpcurl -plaintext -d '' 0.0.0.0:9093 spacemesh.v1.AdminService.EventsStream" >> check.sh \
    && chmod +x check.sh
EXPOSE 7513
CMD ./go-spacemesh --config config.mainnet.json \
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