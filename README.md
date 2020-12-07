# How to build Singularity images on Mac OS

## Prerequisites

1. Open the terminal
2. Create and change into the following directory: `mkdir -p ~/var/vagrant/ && cd  ~/var/vagrant`
3. Clone this repository: `git clone https://github.com/mdittber/rstudio_singularity_MacOS.git`

## Install Vagrant

Singularity images can only be built on a linux based OS.
Vagrant allows to run virtual machines easily preconfigured with Singularity.

1. Open the terminal
2. Install brew (see https://brew.sh)
3. Install Vagrant using brew: 
	* `brew cask install virtualbox`
	* `brew cask install vagrant`
	* `brew cask install vagrant-manager`


## Start the virtual machine (VM)

1. Navigate to the directory containing the Vagrant configuration file.
   `mv vm-singularity`
2. Start the VM with Singularity being pre-installed.
   `vagrant up`
3. Connect to the VM
   `vagrant ssh`
4. Run the required Singurality commands (see section `Build Singualrity Image`)
5. To exit the VM type `exit`
6. To stop the VM type `vagrant down`


## Build a Singularity Images

1. Follow the steps above. When connected to the VM change to the following directory:
   `mv /host/var/vagrant/`
2. Build the image: `(sudo) singularity build 2020-12-07_rstudio-server.simg singularity/2020-12-07_rstudio-server.def`
