FROM ubuntu:24.04

WORKDIR /usr/src/app
COPY . .

#--- Update & Install Required Packages ---
RUN apt update && apt install -y \
    curl \
    vim \
    iputils-ping \
    git \
    zsh \
    wget \
    ca-certificates \
    bash \
    libssl-dev \
    pkg-config

#--- Set Bash as Default Shell ---
SHELL ["/bin/bash", "-c"]

#--- Setup Rust ---
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup component add rustfmt

#--- Install Solana (with Fix) ---
RUN curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev -o /tmp/solana-install.sh
RUN chmod +x /tmp/solana-install.sh
RUN /bin/bash -x /tmp/solana-install.sh -y  # ✅ Add -x for debugging
ENV PATH="/root/.local/share/solana/install/active_release/bin:${PATH}"

# Verify Solana installation
RUN solana --version

#--- Install Node.js & NPM ---
RUN apt install -y nodejs npm
RUN npm install -g n
RUN n latest
RUN ln -sf /usr/local/bin/node /usr/bin/node

#--- Install Anchor ---
RUN npm i -g @project-serum/anchor-cli
RUN npm i -y mocha

#--- Install React ---
RUN npm install -g create-react-app

#--- Fix Node.js OpenSSL Issue ---
ENV NODE_OPTIONS=--openssl-legacy-provider