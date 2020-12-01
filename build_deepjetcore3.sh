#! /bin/sh -x


if [ $(hostname) = "hepgpu01.hephy.oeaw.ac.at" ]
then
   export SINGULARITY_CACHEDIR=/local/$USER/singularity_cache
   export SINGULARITY_TMPDIR=/local/$USER/singularity_tmp
   SINGULARITY_SIFDIR=/local/$USER/singularity
elif [ $(hostname -d) = "cbe.vbc.ac.at" ]
then
   export SINGULARITY_CACHEDIR=/scratch-cbe/users/$USER/singularity_cache
   export SINGULARITY_TMPDIR=/tmp/$USER/singularity_tmp
   SINGULARITY_SIFDIR=/scratch-cbe/users/$USER/singularity
else
   echo "Unknown location"
   exit 1
fi

mkdir -p $SINGULARITY_CACHEDIR $SINGULARITY_TMPDIR $SINGULARITY_SIFDIR

singularity build $SINGULARITY_SIFDIR/deepjetcore3-latest.sif docker://cernml4reco/deepjetcore3:latest
