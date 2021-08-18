# squid-test-proxy

Proxy server for testing proxy functionality of SCM-Manager.
The used proxy server is squid which is started with the docker image sameersbn/squid.
We provide two configuration one without authentication and one with authentication.

## Usage

To start the container with the default configuration (without authentication), 
start the squid.sh script without parameter:

```bash
./squid.sh
```

This will start the container and forwards the port `3128` to squid.
The scripts prints the output of the squid access log.
If the script ends (e.g: on CTRL+C) the container will be removed.

In order to use it with SCM-Manager set the following proxy configuration:

### Proxy Settings

* Enable Proxy: ✓
* Proxy Server: localhost
* Proxy Port: 3128
* Proxy User:
* Proxy Password:
* Proxy Exclude:

## Authentication

To start the container with configured authentication, start the script with the `with-authentication.conf`:

```bash
./squid.sh config/with-authentication.conf
```

This will start squid with configured authentication.

### Proxy Settings

* Enable Proxy: ✓
* Proxy Server: localhost
* Proxy Port: 3128
* Proxy User: trillian
* Proxy Password: secret123
* Proxy Exclude:
