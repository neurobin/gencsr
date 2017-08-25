Simple CSR generator written in Bash.

# Dependency

1. Bash
2. openssl

# Usage

1. Fill the **dom.list** file with domain and subdomain names (one per line, both www and non-www versions). The top entry is taken as CN (Common Name).
2. Edit the **gencsr.conf** file and put necessary information (country code, state, organization name etc ...).
3. Run the `gencsr` script:

```sh
chmod u+x gencsr #giving execution permission
./gencsr
```

# Options

Option | Alt. option | Details | Default value
------ | ----------- | ------- | --------------
  -df  | --dom-file     | file containing domain per line | dom.list
  -k   | --key          | private key file | dom.key
  -ks  | --key-size     | key size | 4096
  -csr | --csr          | CSR file | dom.csr
  -c   | --conf         | configuration file | gencsr.conf
  -oc  | --openssl-conf | OpenSSL config file (use this if `gencsr` can't find it) | `/etc/ssl/openssl.cnf` or `/etc/pki/tls/openssl.cnf` or `openssl.cnf`
  -n   | --new          | Always create new | false
  -h   | --help         | show help | false
  -v   | --version      | show version info | false
  
# Examples

The following creates a new 2048 bit key and saves it into key\_file, takes necessary information from conf\_file, takes the domain list from domain\_file and creates a CSR file named csr\_file.csr:

```sh
./gencsr -n -ks 2048 -k key_file -df domain_file -c conf_file -csr csr_file.csr
```

The following creates CSR using the existing key_file:

```sh
./gencsr -k key_file -df domain_file -c conf_file -csr csr_file.csr
```
# Configuration file
This file is parsed by gencsr to get various information. Path to this file can be given by the `-c` or `--conf` options. If no path is given, the path is defaulted to `./gencsr.conf`.

This is how a typical configuration file for gencsr looks like:

```conf
############# gencsr config file #####################
# Do not use quotation marks (', "")
# To prevent any entry being included, comment them
# by adding a # at the beginning
######################################################
CountryCode=US                              # Put two character country code
State=My state                              # Put state name
Locality=My city                            # Put city name
Oraganization=My organization               # Put organization name
OraganizationUnit=Technology or whatever    # Put organization unit name
Email=mymail@somedomain.com                 # Put email address
```

# Domain file
This is a file containing domain names per line. Put both www and non-www versions. Put the CN (root domain) at top. Path to this file can be provided by the `-df` or `--dom-file` options. If no path is given, it's defaulted to `./dom.list`.

This is how a domain file looks like:

```
example.org
www.example.org
docs.example.org
www.docs.example.org
api.example.org
www.api.example.org
forums.example.org
www.forums.example.org
```

