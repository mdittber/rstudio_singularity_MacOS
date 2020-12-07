export SINGULARITYENV_USER=$USER
export SINGULARITYENV_PASSWORD=rstudiopassword
echo $SINGULARITYENV_USER && echo $SINGULARITYENV_PASSWORD

singularity exec \
	-C \
	-B $(pwd):/home/rstudio \
	-B $(pwd):$HOME \
	-B $(pwd)/rserver.conf:/etc/rstudio/rserver.conf \
	--overlay overlay.img \
	custom_rstudio_extension1.simg \
	/usr/lib/rstudio-server/bin/rserver --www-port 8787 --www-address 0.0.0.0 --auth-none=1 --auth-validate-users=0 # --auth-pam-helper-path=pam-helper

	# custom_rstudio.simg \
	# rstudio.simg \
	# tidyverse_3.6.1.sif \
	# tidyverse_long_simple.sif \
