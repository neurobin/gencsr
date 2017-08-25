% gencsr(1) gencsr user manual
% Md. Jahidul Hamid <https://github.com/neurobin>
% August 25, 2017

# NAME

**gencsr** -- Simple CSR generator

# SYNOPSIS

**gencsr** \[ options ]

# DEPENDENCIES

1. Bash
2. openssl

# USAGE

**`gencsr` expects a dom.list and gencsr.conf file under current directory if not specified specifically**

1. Create a **dom.list** file in the working directory with domain and subdomain names (one per line, both www and non-www versions). The top entry is taken as CN (Common Name).
2. Edit the **gencsr.conf** file under current working directory (you may copy it from */etc/gencsr.conf* if `gencsr` is indtalled) and put necessary information (country code, state, organization name etc ...).
3. Run `gencsr`.

# OPTIONS

-df, --dom-file *dom_file_path*
: File containing domain per line \[dom.list]

-k, --key *key_file_path*
: Private key file (existing or to be created) \[dom.key]

-ks, --key-size *key_size*
: Key size if key is to be created a-new. \[4096]

-csr, --csr *csr_file_path*
: CSR file to be created \[dom.csr]

-c, --conf *config_file_path*
: **gencsr** configuration file \[gencsr.conf]

-oc, --openssl-conf *openssl_config_file*
: OpenSSL config file (use this if `gencsr` can't find it). By default, it is searched as `/etc/ssl/openssl.cnf` or `/etc/pki/tls/openssl.cnf` or `./openssl.cnf`.

-n, --new
: Always create new \[false]

-h, --help
: Show help

-v, --version
: Show version info
  
# Examples

The following creates a new 2048 bit key and saves it into *kfile*, takes necessary information from *cfile*, takes the domain list from *dfile* and creates a CSR file named *csrfile.csr*:

```sh
gencsr -n -ks 2048 -k kfile -df dfile -c cfile -csr csrfile.csr
```

The following creates CSR using the existing kfile:

```sh
gencsr -k kfile -df dfile -c cfile -csr csrfile.csr
```
# CONFIGURATION FILE

This file is parsed by gencsr to get various information. Path to this file can be given by the `-c` or `--conf` options. If no path is given, the path is defaulted to `./gencsr.conf`.

This is how a typical configuration file for gencsr looks like:

```conf
############# gencsr config file #####################
# Do not use quotation marks (', "")
# To prevent any entry being included, comment them
# by adding a # at the beginning
######################################################
CountryCode=US                              
State=My state                              
Locality=My city                            
Oraganization=My organization               
OraganizationUnit=Technology or whatever   
Email=mymail@somedomain.com                 
```

# DOMAIN FILE

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

# BUG REPORT

<https://github.com/neurobin/gencsr/issues>
