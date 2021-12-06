FROM node:14

WORKDIR /app

RUN yarn global add http-server

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --non-interactive 

COPY . .

ARG ARAGON_APP_LOCATOR
ARG ARAGON_ETH_NETWORK_TYPE
ARG ARAGON_ENS_REGISTRY_ADDRESS
ARG ARAGON_IPFS_GATEWAY
ARG ARAGON_DEFAULT_ETH_NODE
ARG ARAGON_WALLETCONNECT_RPC_URL
ARG ARAGON_PORTIS_DAPP_ID
ARG ARAGON_FORTMATIC_API_KEY
ARG ARAGON_SENTRY_DSN

ENV ARAGON_APP_LOCATOR=$ARAGON_APP_LOCATOR
ENV ARAGON_ETH_NETWORK_TYPE=$ARAGON_ETH_NETWORK_TYPE
ENV ARAGON_ENS_REGISTRY_ADDRESS=$ARAGON_ENS_REGISTRY_ADDRESS
ENV ARAGON_IPFS_GATEWAY=$ARAGON_IPFS_GATEWAY
ENV ARAGON_DEFAULT_ETH_NODE=$ARAGON_DEFAULT_ETH_NODE
ENV ARAGON_WALLETCONNECT_RPC_URL=$ARAGON_WALLETCONNECT_RPC_URL
ENV ARAGON_PORTIS_DAPP_ID=$ARAGON_PORTIS_DAPP_ID
ENV ARAGON_FORTMATIC_API_KEY=$ARAGON_FORTMATIC_API_KEY
ENV ARAGON_SENTRY_DSN=$ARAGON_SENTRY_DSN
ENV NODE_OPTIONS=--max_old_space_size=4096
RUN yarn build

ENTRYPOINT ["http-server"]
