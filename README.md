# How to build and run Singularity images on Mac OS

## Prerequisites

1. Open a terminal
2. Create and change into the following directory
   ```bash
   $ mkdir -p ~/var/vagrant/ && cd  ~/var/vagrant
   ```
3. Clone this repository
   ```bash
   $ git clone https://github.com/mdittber/rstudio_singularity_MacOS.git
   ```

## Install Vagrant

Singularity images can only be built on a linux based OS.
Vagrant allows to run virtual machines easily preconfigured with Singularity.

1. Open the terminal
2. Install brew (see https://brew.sh)
3. Install Vagrant using brew
   ```bash
	$ brew cask install virtualbox vagrant vagrant-manager
   ```


## Start the virtual machine (VM)

1. Navigate to the directory containing the Vagrant configuration file
   ```bash
   $ mv vm-singularity
   ```
2. Start the VM with Singularity being pre-installed
   ```bash
   $ vagrant up
   ```
3. Connect to the VM
   ```bash
   $ vagrant ssh
   ```
4. Run the required Singurality commands (see section **Build Singualrity Image**)
5. To exit the VM type 
   ```bash
   $ exit
   ```
6. To stop the VM type
   ```bash
   vagrant halt
   ```


## Build a Singularity Image

1. Follow the steps above. When connected to the VM change to the following directory:
   ```bash
   $ cd /host/var/vagrant/rstudio_singularity_MacOS
   ```
2. Build the image
   ```bash
   $ sudo singularity build rstudio-server.simg rstudio-server.def
   ```


## Run the created image

1. Start RStudio Server
   * Change the port if needed (e.g. when deploying on LeoMed)
   ```bash
   $ singularity shell -B ~:/opt rstudio-server.simg
   $ rserver --www-port 8787 --www-address 0.0.0.0 --auth-none=1 --auth-validate-users=0 --auth-minimum-user-id=0 --server-daemonize 0 --server-data-dir /opt
   ```
2. Open a browser and type:
   `localhost:8787`
