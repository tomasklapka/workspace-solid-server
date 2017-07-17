# Solid server workspace seed

Docker* files and some helper scripts to simplify beginning with [Solid](https://github.com/solid) server.

Included are docker-compose configurations for implementations:
 
 * [solid-server](https://github.com/solid/node-solid-server)
 * [gold](https://github.com/linkeddata/gold)


## Usage

### Prerequisities

* docker
* docker-compose

### Install

Clone this repository

### Configuration

#### /etc/hosts

To point your DOMAIN to your localhost, add it to 127.0.0.1 in `/etc/hosts`

Example of the line in /etc/hosts:
```
127.0.0.1       localhost.localdomain localhost alice.example.com
```

#### certs

After cloning the repository, place your domain's key and certificate into ./certs directory as:

 * `./certs/<DOMAIN>.key`
 * `./certs/<DOMAIN>.crt`.

###### Self signed cert for development:

You can use helper script `./gen-self-signed-cert-helper <DOMAIN>` to generate self signed cert.

If you ommit the DOMAIN parameter, `alice.example.com` will be used.

#### Servers

##### gold
In `docker-compose.gold.yml` change alice.example.com to your DOMAIN, if necessary.

##### solid-server (nss)
Node solid-server has configuration in `config.json`. Change alice.example.com to your DOMAIN, if necessary.

Optionally change solid-server branch (-b option) in Dockerfile, if you want another version.


### Running

Use docker-compose directly with the desired implementation config:

* `docker-compose -f docker-compose.nss.yml up`
* `docker-compose -f docker-compose.gold.yml up`

#### wrapper scripts

You can use `./nss` or `./gold` wrappers: 

* `./nss up`
* `./gold up`

Or you can use the wrappers to copy the desired config to the default config filename `./docker-compose.yml` (or symlink it):

* './nss set'
* './gold set'

and with default config file you can just use:

`docker-compose up`


### WebId

There are issues with generating certificates because keygen html tag is being removed from browsers.

If you need to generate your WebId certificate and keys, try one of these scripts:
* [Shell script to create a WebID certificate using OpenSSL](https://gist.github.com/njh/2432427) (I've not tried this one yet)
* [WebID generation bash script (requires openssl)](https://gist.github.com/tomasklapka/ced88b6b72538a5ffe6baffcd898dea8) (requires 'root' access)












