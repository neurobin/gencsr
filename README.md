Simple CSR generator

#Usage

1. Fill the **doms** file with domain and subdomain names (one per line)
2. Edit the **gencsr** file and run it:

```sh
./gencsr
```

#Editables in gencsr script:

**General:**

```sh
country_code=''     # Put two character country code
state=''            # Put state name
locality=''         # Put city name
org=''              # Put organization name
org_unit=''         # Put organization unit name
email=''            # Put email address
```

**More:**

```sh
domfile=doms        # Path to file containing domain names per line
dkeyfile=dom.key    # Path to a private key file (to be created)
csrfile=dom.csr     # Path to the CSR file (to be created)
```
