### Installing pip packages to lower version of python
* Jupyter only supports Python 3.9, install packages using: `/path/to/file -m pip3 install biopython`, i.e. `/usr/bin/python3 -m pip install biopython`

### Setting up the Ribosomal Database Project
* Setting up RDP & Docker [tutorial](https://jfq3.gitbook.io/rdptools-docker/rdptools-docker/creating-the-container/creating-the-container)
* map to local:
    * `docker pull rdpstaff/rdp_tools`
    * `docker run --name rdp_tools -it --platform linux/amd64 -v ~/Desktop/RDPtools_data:/home/RDPuser rdpstaff/rdp_tools`
    * sudo password: RDPuser
* launch docker:
    * `docker start rdp_tools`
    * `docker attach rdp_tools`

### Using RDP to BLAST data
* to unzip all `.gz` files, run `gunzip *.gz`
* run `./classifier_script.sh` within the Docker environment