Simple CSR generator written in Bash.

# Usage

1. Fill the **dom.list** file with domain and subdomain names (one per line, both www and non-www versions).
2. Edit the **gencsr.conf** file and put necessary information.
3. Run the `gencsr` file:

```sh
chmod u+x gencsr #giving execution permission
./gencsr
```

# Options

Option | Alt. option | Details
------ | ----------- | -------
  -df  | --dom-file | file containing domain per line
  -k   | --key      | private key file
  -ks  | --key-size | key size
  -csr | --csr      | CSR file
  -c   | --conf     | configuration file
  -n   | --new      | Always create new
  -h   | --help     | show help
  -v   | --version  | show version info
  
# Examples

The following creates a new 2048 bit key and saves it into key\_file, takes necessary information from conf\_file, takes the domain list from domain\_file and creates a CSR file named csr\_file.csr:

```sh
./gencsr -n -ks 2048 -k key_file -df domain_file -c conf_file -csr csr_file.csr
```

The following creates CSR using the existing key_file:

```sh
./gencsr -k key_file -df domain_file -c conf_file -csr csr_file.csr
```

